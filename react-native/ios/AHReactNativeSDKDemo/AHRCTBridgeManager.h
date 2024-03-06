//
//  AHRCTBridgeManager.h
//  ReactNativeDemo
//
//  Created by 李翔宇 on 2017/12/8.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCTBridge.h"
#import "AHRCTBridge.h"

NS_ASSUME_NONNULL_BEGIN

@interface AHRCTBridgeManager : NSObject

+ (void)startWithLaunchOptions:(NSDictionary *)options;
+ (void)prepareBridgeWithKey:(NSString *)key success:(AHRCTBridgePrepareBlock)success;
+ (void)freeBridgeWithKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
