#import "BaseDBDao.h"
//#import "fileengine.h"
#import "SPDBManager.h"
@interface BaseDBDao()

@end
@implementation BaseDBDao
-(BOOL) isExistTableWithName:(NSString*) tableName{
    int32_t tableCount = 0;
    FMDatabase* db = [self getDataBase];
    NSString* sql = [[NSString alloc] initWithFormat:
                     @"SELECT count(*) as TABLECOUNT from sqlite_master where tbl_name= '%@'", tableName];
    FMResultSet *rs = [db executeQuery:sql];
    if ([rs next])
    {
        // just print out what we've got in a number of formats.
        tableCount = [rs intForColumn:@"TABLECOUNT"];
    }
    
    return tableCount > 0;
    
    
    
}

-(BOOL) executeSQL:(NSString*) sql{
    FMDatabase *db = [self getDataBase];
    return [db executeUpdate:sql];
}

- (BOOL)existRecordBySql:(NSString *)sql
{
    FMDatabase *db = [self getDataBase];
    
	FMResultSet *rs = [db executeQuery:sql];
    
    BOOL bExist = ([rs next]);
    
//    [rs close];
    
    return bExist;
}

-(FMDatabase*) getDataBase{
    
    return [[SPDBManager manager]db];;
}
@end
