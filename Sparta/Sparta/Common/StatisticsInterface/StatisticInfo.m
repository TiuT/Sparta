//
//  StatisticInfo.m
//  Sparta
//
//  Created by Ginvar on 16/10/9.
//  Copyright © 2016年 Ginvar. All rights reserved.
//

#import "StatisticInfo.h"
#import "MainDef.h"

@implementation StatisticInfo

@synthesize plateFlag;
@synthesize channelFlag;
@synthesize version;
@synthesize udid;
@synthesize networkType;
@synthesize sysVer;


+ (NSString*) appVersion
{
#ifdef _IPHONE_
    return APP_VERSION;
#else
    return HD_APP_VERSION;
#endif
}

@end
