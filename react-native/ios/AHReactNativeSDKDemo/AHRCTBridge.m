//
//  AHRCTBridge.m
//  ReactNativeDemo
//
//  Created by 李翔宇 on 2017/12/9.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "AHRCTBridge.h"

@interface AHRCTBridge()

@property(nonatomic, strong) RCTBridge *bridge;
@property(atomic, assign, getter=isFrameworkReady) BOOL frameworkReady;
@property(nonatomic, strong) AHRCTBridgePrepareBlock success;

@end

@implementation AHRCTBridge

- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self name:RCTJavaScriptDidLoadNotification object:nil];
}

- (instancetype)init {
  self = [self initWithLaunchOptions:nil];
  return self;
}

- (instancetype)initWithLaunchOptions:(NSDictionary *)options {
  self = [super init];
  if(self) {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(RCTJavaScriptDidLoadNotification:) name:RCTJavaScriptDidLoadNotification object:nil];
    
    NSURL *frameworkURL = [[NSBundle mainBundle] URLForResource:@"common111.ios" withExtension:@"bundle"];
    self.bridge = [[RCTBridge alloc] initWithFrameworkBundleURL:frameworkURL launchOptions:options];
  }
  return self;
}

- (void)prepareBridge:(AHRCTBridgePrepareBlock)success {
  if(!self.isFrameworkReady) {
    self.success = success;
    return;
  }
  
  !self.success ? : self.success(self.bridge);
}

- (void)RCTJavaScriptDidLoadNotification:(NSNotification *)notification {
  if(notification.object != self.bridge) {
    return;
  }
  
  [[NSNotificationCenter defaultCenter] removeObserver:self name:RCTJavaScriptDidLoadNotification object:nil];
  !self.success ? : self.success(self.bridge);
  self.frameworkReady = YES;
}

@end
