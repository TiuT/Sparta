#import <Foundation/Foundation.h>
#define DB_VERSION_TABLE @"db_version_key"
#define DB_VERSION_TYPE_KEY 1
#define DB_VERSION_TYPE_APPVERSION 2
@interface OptEntity : NSObject
@property (nonatomic,copy) NSString*opt_key;
@property (nonatomic,copy) NSString*opt_type;
@end
