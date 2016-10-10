
#import <Foundation/Foundation.h>
#import "FMDataBase.h"

@interface BaseDBDao : NSObject

//判断表是否存在
-(BOOL) isExistTableWithName:(NSString*) tableName;

//判断记录是否存在
- (BOOL)existRecordBySql:(NSString *)sql;

//执行sql语句
-(BOOL) executeSQL:(NSString*) sql;

-(FMDatabase*) getDataBase;

@end
