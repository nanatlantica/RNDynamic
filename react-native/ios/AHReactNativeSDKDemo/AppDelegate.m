#import "AppDelegate.h"

#import "RCTBridge.h"
#import "RCTBundleURLProvider.h"
#import "RCTRootView.h"
#import "AHRCTBridgeManager.h"

#ifdef FB_SONARKIT_ENABLED
#import <FlipperKit/FlipperClient.h>
#import <FlipperKitLayoutPlugin/FlipperKitLayoutPlugin.h>
#import <FlipperKitUserDefaultsPlugin/FKUserDefaultsPlugin.h>
#import <FlipperKitNetworkPlugin/FlipperKitNetworkPlugin.h>
#import <SKIOSNetworkPlugin/SKIOSNetworkAdapter.h>
#import <FlipperKitReactPlugin/FlipperKitReactPlugin.h>

static void InitializeFlipper(UIApplication *application) {
  FlipperClient *client = [FlipperClient sharedClient];
  SKDescriptorMapper *layoutDescriptorMapper = [[SKDescriptorMapper alloc] initWithDefaults];
  [client addPlugin:[[FlipperKitLayoutPlugin alloc] initWithRootNode:application withDescriptorMapper:layoutDescriptorMapper]];
  [client addPlugin:[[FKUserDefaultsPlugin alloc] initWithSuiteName:nil]];
  [client addPlugin:[FlipperKitReactPlugin new]];
  [client addPlugin:[[FlipperKitNetworkPlugin alloc] initWithNetworkAdapter:[SKIOSNetworkAdapter new]]];
  [client start];
}
#endif

@implementation AppDelegate
#define ReactNativeDemoForceLoad 0
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//#ifdef FB_SONARKIT_ENABLED
//  InitializeFlipper(application);
//#endif
//  [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"AHNetworkConfigRNDebugOn"];
//  [[NSUserDefaults standardUserDefaults] synchronize];
//  [[RCTBundleURLProvider sharedSettings] setJsLocation:@"10.168.170.86"];
//  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];
//  RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge
//                                                   moduleName:@"App"
//                                            initialProperties:nil];
//  [[RCTBundleURLProvider sharedSettings] setJsLocation:@"10.168.170.86"];
//  NSURL *bundleURL = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
//  NSURL *bundleURL = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
//  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:bundleURL
//                                                      moduleName:@"packageTest"
//                                               initialProperties:nil
//                                                   launchOptions:launchOptions];

//  if (@available(iOS 13.0, *)) {
//      rootView.backgroundColor = [UIColor systemBackgroundColor];
//  } else {
//      rootView.backgroundColor = [UIColor whiteColor];
//  }
//
//  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//  UIViewController *rootViewController = [UIViewController new];
//  rootViewController.view = rootView;
//  self.window.rootViewController = rootViewController;
//  [self.window makeKeyAndVisible];
//  return YES;

  // AwesomeProject642
  // "AHReactNativeSDK"
//  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];
//  RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge
//                                                   moduleName:@"AwesomeTSProject0642"
//                                            initialProperties:nil];
//
//  if (@available(iOS 13.0, *)) {
//      rootView.backgroundColor = [UIColor systemBackgroundColor];
//  } else {
//      rootView.backgroundColor = [UIColor whiteColor];
//  }
//
//  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//  UIViewController *rootViewController = [UIViewController new];
//  rootViewController.view = rootView;
//  self.window.rootViewController = rootViewController;
//  [self.window makeKeyAndVisible];
//  return YES;
  
//  [AHRCTBridgeManager startWithLaunchOptions:launchOptions];
//  [AHRCTBridgeManager prepareBridgeWithKey:@"common111.ios" success:^(RCTBridge *bridge) {
//    bridge.customOptions[@"test"] = @"这是一个自定义option";
//    return;
//
//    NSURL *bundleURL = [[NSBundle mainBundle] URLForResource:@"sort.ios" withExtension:@"jsbundle"];
//    [bridge ah_loadCustomBundleURL:bundleURL];
//
//    RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge moduleName:@"MyApp" initialProperties:nil];
//    if (@available(iOS 13.0, *)) {
//        rootView.backgroundColor = [UIColor systemBackgroundColor];
//    } else {
//        rootView.backgroundColor = [UIColor whiteColor];
//    }
//    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    UIViewController *rootViewController = [UIViewController new];
//    rootViewController.view = rootView;
//    self.window.rootViewController = rootViewController;
//    [self.window makeKeyAndVisible];
//  }];
//
//  return YES;
  
  
  RCTBridge *bridge =[[RCTBridge alloc] initWithFrameworkBundleURL:[[NSBundle mainBundle] URLForResource:@"common.ios" withExtension:@"bundle"] launchOptions:launchOptions];
  NSURL *jsCodeLocationBuz = [[NSBundle mainBundle] URLForResource:@"index.ios" withExtension:@"bundle"];

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIViewController *rootViewController = [UIViewController new];
  self.window.rootViewController = rootViewController;
//  rootViewController.view = rootView;
  [self.window makeKeyAndVisible];
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [bridge ah_loadCustomBundleURL:jsCodeLocationBuz];
    RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge
           moduleName:@"AwesomeTSProject0642"
    initialProperties:nil];
    rootViewController.view = rootView;
  });
  return YES;
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
//#if DEBUG
//  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
//#else
  
  //main_company
  return [[NSBundle mainBundle] URLForResource:@"index_config" withExtension:@"jsbundle"];
//#endif
}

@end
