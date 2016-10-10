//
//  SPDBManager.m
//  Sparta
//
//  Created by Ginvar on 16/10/9.
//  Copyright © 2016年 Ginvar. All rights reserved.
//

#import "SPDBManager.h"
#import <objc/runtime.h>
#import "FMDatabase.h"
#import "OptEntity.h"
#import "OptDao.h"
#import "StatisticInfo.h"


@implementation SPDBManager
-(id)init{
    self = [super init];
    if(self){
        NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"Sparta.db"];
        
        //创建数据库
        _db = [FMDatabase databaseWithPath:filePath];
        
        if(![_db open]){
            NSLog(@"db open failed.");
        }
    }
    return self;
}

+ (SPDBManager *)manager
{
    static dispatch_once_t once1;
    static SPDBManager * singleton = nil;
    if (singleton==nil) {
        dispatch_once( &once1, ^{
            singleton = [[SPDBManager alloc] init];
            [singleton initTable];
        } );
        
    }
    return singleton;
}

-(void)initTable{
    [self createTable];//创建table
    //[self updateTableNew];//修改数据库
}

//判断表是否存在
-(BOOL) isExistTableWithName:(NSString*) tableName{
    int32_t tableCount = 0;
    FMDatabase*db = [self db];
    NSString* sql = [[NSString alloc] initWithFormat:
                     @"SELECT count(*) as TABLECOUNT from sqlite_master where tbl_name= '%@'", tableName];
    FMResultSet*rs = [db executeQuery:sql];
    if ([rs next])
    {
        tableCount = [rs intForColumn:@"TABLECOUNT"];
    }
    return tableCount > 0;
}

//创建数据库表
-(void) createTable
{
    unsigned int nCount = 0;
    
    Method *methodList = class_copyMethodList([self class],&nCount);
    for (int i = 0; i < nCount; i++)
    {
        SEL sel = method_getName(methodList[i]);
        NSString*selName = [NSString stringWithCString:sel_getName(sel) encoding:NSUTF8StringEncoding];
        //运行以create命名的方法
        if ([selName hasPrefix:@"create"]&&![selName isEqualToString:@"createTable"]) {
            NSLog(@"run sel:%@",selName);

            if ([self respondsToSelector:sel])
            {
                IMP imp = [self methodForSelector:sel];
                void (*func)(id, SEL) = (void *)imp;
                func(self, sel);
            }
        }
        
        
    }
    free(methodList);
}


- (NSArray*)updateMethods
{
    NSMutableArray *array=[NSMutableArray array];
    
    //想要添加到表中的新字段，方法格式命名："updateAdd+属性名+in＋表名"
    
    /* 使用如下：
    [array addObject:@"updateAddSongSourceInPlayStatistic"];
    [array addObject:@"updateAddSongSourceNewInPlayStatistic"];
    [array addObject:@"updateAddWeightColInLCollectList"];
     */
    return array;
}

//数据库表结构修改
-(void) updateTableNew{
    OptDao*dao = [[OptDao alloc]init];
    NSString*oldVersion = [dao getUpdateAppVersion];//获取上一次修改数据库的版本
    if (![oldVersion isEqualToString:[StatisticInfo appVersion]])
    {
        NSArray*operatedKeys = [dao queryOperatedList];
        
        NSMutableArray*newoperatKey = [NSMutableArray array];
        BOOL isAllSuccess = YES;
        
        //        Method *methodList = class_copyMethodList([self class],&nCount);
        NSArray *updateArrays = [self updateMethods];
        for (NSUInteger i = 0; i < [updateArrays count]; i++)
        {
            NSString*selName = [updateArrays objectAtIndex:i];
            if (selName==nil||[operatedKeys containsObject:selName]) {
                continue;
            }
            SEL sel = NSSelectorFromString(selName);
            if ([self respondsToSelector:sel])
            {//
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                BOOL isOk = [self performSelector:sel withObject:nil];
                if (!isOk)
                {
                    isAllSuccess = NO;
                }
                else
                {
                    [newoperatKey addObject:selName];
                }
#pragma clang diagnostic pop
                
                
            }
            
        }
        if(isAllSuccess)
        {
            [dao updateVersion:[StatisticInfo appVersion] AndOptKeys:newoperatKey];
        }
        
    }
    
}

/**
 *  创建数据库版本表
 */
-(void) create{
    if (![self isExistTableWithName:DB_VERSION_TABLE])
    {
        NSString*sql =[NSString stringWithFormat: @"CREATE TABLE %@(\
                       op_key TEXT,\
                       op_type INTEGER)",DB_VERSION_TABLE];
        [[self db] executeUpdate:sql];
        
    }
}

@end
