//
//  SPDBManager.h
//  Sparta
//
//  Created by Ginvar on 16/10/9.
//  Copyright © 2016年 Ginvar. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FMDatabase;

@interface SPDBManager : NSObject

@property(nonatomic,readonly) FMDatabase* db;

+ (SPDBManager *)manager;
@end
