#import <Foundation/Foundation.h>

@interface SPHttp : NSObject<NSCopying>

+ (instancetype)sharedInstance;

- (void)loadDataInfo:(nullable NSString *)URLString
          parameters:(nullable id)parameters
             success:(nullable void (^)(id _Nullable responseObject))success
             failure:(nullable void (^)(NSError *_Nullable error))failure;

- (void)loadDataInfoPost:(nullable NSString *)URLString
              parameters:(nullable id)parameters
                 success:(nullable void (^)(id _Nullable responseObject))success
                 failure:(nullable void (^)(NSError *_Nullable error))failure;

- (void)loadDataInfoDelete:(nullable NSString *)URLString
            parameters:(nullable id)parameters
                success:(nullable void (^)(id _Nullable responseObject))success
                failure:(nullable void (^)(NSError *_Nullable error))failure;
@end