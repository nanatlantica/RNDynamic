 //
//  AHRCTBridgeManager.m
//  ReactNativeDemo
//
//  Created by 李翔宇 on 2017/12/8.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "AHRCTBridgeManager.h"

@interface AHRCTBridgeManager()

@property(nonatomic, strong) NSDictionary *launchOptions;
@property(nonatomic, strong) NSMutableDictionary <NSString *, AHRCTBridge *> *bridgesM;
@property(nonatomic, strong) AHRCTBridge *freeBridge;

@end

@implementation AHRCTBridgeManager

+ (AHRCTBridgeManager *)manager {
  static AHRCTBridgeManager *sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [[super allocWithZone:NULL] init];
    sharedInstance.bridgesM = [NSMutableDictionary dictionary];
  });
  return sharedInstance;
}

#pragma mark - Public Method

+ (void)startWithLaunchOptions:(NSDictionary *)options {
  self.manager.launchOptions = options;
  self.manager.freeBridge = [[AHRCTBridge alloc] initWithLaunchOptions:self.manager.launchOptions];
}

+ (void)prepareBridgeWithKey:(NSString *)key success:(AHRCTBridgePrepareBlock)success {
  AHRCTBridge *bridge = self.manager.bridgesM[key];
  if(!bridge) {
    bridge = self.manager.freeBridge;
    self.manager.bridgesM[key] = bridge;
    self.manager.freeBridge = [[AHRCTBridge alloc] initWithLaunchOptions:self.manager.launchOptions];
  }
  [bridge prepareBridge:success];
}

+ (void)freeBridgeWithKey:(NSString *)key {
  self.manager.bridgesM[key] = nil;
}

@end
