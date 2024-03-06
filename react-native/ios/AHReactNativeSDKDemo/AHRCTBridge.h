//
//  AHRCTBridge.h
//  ReactNativeDemo
//
//  Created by 李翔宇 on 2017/12/9.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCTBridge.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^AHRCTBridgePrepareBlock)(RCTBridge *bridge);

@interface AHRCTBridge : NSObject

- (instancetype)initWithLaunchOptions:(NSDictionary *)options;
- (void)prepareBridge:(AHRCTBridgePrepareBlock)success;

@end

NS_ASSUME_NONNULL_END
