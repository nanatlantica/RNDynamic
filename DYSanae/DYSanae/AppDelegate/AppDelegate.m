//
//  AppDelegate.m
//  DYSanae
//
//  Created by DongYi on 2022/1/4.
//

#import "AppDelegate.h"
#import "DYMainAppearanceManager.h"

#import <React/RCTBundleURLProvider.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.moduleName = @"AHReactNativeSDK";
    // You can add your custom initial props in the dictionary below.
    // They will be passed down to the ViewController used by React Native.
    self.initialProps = @{};
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
    
    [DYMainAppearanceManager initCommonAppearances];
    return YES;
}


#pragma mark - UISceneSession lifecycle


//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
    //your bundle address
  NSURL *url = [NSURL URLWithString:@"http://192.168.1.104:8081/index.bundle?platform=ios&dev=true&minify=false"];
  return url;
}


@end
