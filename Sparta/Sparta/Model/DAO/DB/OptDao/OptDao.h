#import "BaseDBDao.h"

@interface OptDao : BaseDBDao
-(NSString*) getUpdateAppVersion;
-(NSArray*) queryOperatedList;
-(void) updateVersion:(NSString*) appVersion AndOptKeys:(NSArray*) optKeys;
@end
