#import "OptDao.h"
#import "OptEntity.h"

@implementation OptDao
-(NSString*) getUpdateAppVersion
{
    NSString*sql = [NSString stringWithFormat:@"SELECT op_key FROM %@ WHERE op_type=%d",DB_VERSION_TABLE,DB_VERSION_TYPE_APPVERSION];
    FMResultSet*rs = [[self getDataBase] executeQuery:sql];
    NSString*appVersion = nil;
    if ([rs next])
    {
        appVersion = [rs stringForColumn:@"op_key"];
    }
    return appVersion;
}
-(NSArray*) queryOperatedList
{
    NSMutableArray*queryArray = [NSMutableArray array];
    NSString*sql = [NSString stringWithFormat:@"SELECT op_key FROM %@ WHERE op_type=%d",DB_VERSION_TABLE,DB_VERSION_TYPE_KEY];
    FMResultSet*rs = [[self getDataBase] executeQuery:sql];
    while ([rs next])
    {
        NSString*key = [rs stringForColumn:@"op_key"];
        if (key!=nil)
        {
            [queryArray addObject:[rs stringForColumn:@"op_key"]];
        }
        
    }
    return queryArray;
}
-(void) updateVersion:(NSString*) appVersion AndOptKeys:(NSArray*) optKeys
{
    NSString*oldVersion = [self getUpdateAppVersion];
    if (oldVersion == nil)
    {
        NSString*insertSql = [NSString stringWithFormat:@"INSERT INTO %@ (op_key,op_type) VALUES ('%@',%d)",DB_VERSION_TABLE,appVersion,DB_VERSION_TYPE_APPVERSION];
        [[self getDataBase] executeUpdate:insertSql];
    }
    else
    {
        NSString*updateSql = [NSString stringWithFormat:@"UPDATE %@ set op_key='%@' WHERE op_type=%d",DB_VERSION_TABLE,appVersion,DB_VERSION_TYPE_APPVERSION];
        [[self getDataBase] executeUpdate:updateSql];
    }
    
    for (NSString* keyItem in optKeys)
    {
        NSString*insertItemSql = [NSString stringWithFormat:@"INSERT INTO %@ (op_key,op_type) VALUES ('%@',%d)",DB_VERSION_TABLE,keyItem,DB_VERSION_TYPE_KEY];
        [[self getDataBase] executeUpdate:insertItemSql];
    }
    
    
    
}
@end
