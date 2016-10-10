//
//  StatisticInfo.h
//  Sparta
//
//  Created by Ginvar on 16/10/9.
//  Copyright © 2016年 Ginvar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StatisticInfo : NSObject
{
    NSString*   plateFlag;  // 平台号
    NSString*   channelFlag;    // 渠道号
    NSString*   version;    // 版本号
    NSString*   udid;       // 设备id
    NSString*   networkType; // 网络类型
    NSString*   sysVer; // 系统版本
}

@property (nonatomic, retain) NSString* plateFlag;
@property (nonatomic, retain) NSString* channelFlag;
@property (nonatomic, retain) NSString* version;
@property (nonatomic, retain) NSString* udid;
@property (nonatomic, retain) NSString* networkType;
@property (nonatomic, retain) NSString* sysVer;


+ (NSString*) appVersion;
//+ (NSString*) plateFlag;
//+ (NSString*) channelFlag;
//+ (NSString*) udid;
//+ (NSString*) networkType;
//+ (NSString*) sysVer;

@end
