//
//  AHRNNewArcDelegateInstance.m
//  AHReactNativeSDK
//
//  Created by DongYi on 2024/3/3.
//

#import "AHRNNewArcDelegateInstance.h"

#import <React/RCTCxxBridgeDelegate.h>
#import <React/RCTRootView.h>
#import <React/RCTRuntimeExecutorFromBridge.h>
#import <React/RCTJSIExecutorRuntimeInstaller.h>
#import <react/renderer/runtimescheduler/RuntimeScheduler.h>
#import <react/renderer/runtimescheduler/RuntimeSchedulerBinding.h>
#import <React/RCTBundleURLProvider.h>
#import <ReactCommon/RCTTurboModuleManager.h>
#import <react/renderer/runtimescheduler/RuntimeSchedulerCallInvoker.h>
#import <React/CoreModulesPlugins.h>

#import <React/RCTFabricSurfaceHostingProxyRootView.h>
#import <React/RCTSurfacePresenter.h>
#import <React/RCTSurfacePresenterBridgeAdapter.h>
#import <react/config/ReactNativeConfig.h>

#import <React/JSCExecutorFactory.h>

@interface AHRNNewArcDelegateInstance () <RCTBridgeDelegate, RCTCxxBridgeDelegate, RCTTurboModuleManagerDelegate> {
    std::shared_ptr<const facebook::react::ReactNativeConfig> _reactNativeConfig;
    facebook::react::ContextContainer::Shared _contextContainer;
    RCTTurboModuleManager *_turboModuleManager;
    std::shared_ptr<facebook::react::RuntimeScheduler> _runtimeScheduler;
    NSString *_moduleName;
}

@property (nonatomic, strong) RCTBridge *bridge;
@property (nonatomic, strong) RCTTurboModuleManager *turboModuleManager;
@property (nonatomic, strong) RCTSurfacePresenterBridgeAdapter *bridgeAdapter;

@end

@implementation AHRNNewArcDelegateInstance

- (instancetype)init {
    self = [super init];
    if (self) {
        _moduleName = @"AwesomeProject";
        _contextContainer = std::make_shared<facebook::react::ContextContainer const>();
        _reactNativeConfig = std::make_shared<facebook::react::EmptyReactNativeConfig const>();
        _contextContainer->insert("ReactNativeConfig", _reactNativeConfig);
        self.bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:@{}];
        self.bridgeAdapter = [[RCTSurfacePresenterBridgeAdapter alloc]
              initWithBridge:_bridge
            contextContainer:_contextContainer];

        self.bridge.surfacePresenter = _bridgeAdapter.surfacePresenter;
        [self createView];
    }
    return self;
}

- (UIView *)createView {
    if ([self ah_enableNewArc]) {
        
          _rootView =
              [[RCTFabricSurfaceHostingProxyRootView alloc] initWithBridge:_bridge
                                                                moduleName:_moduleName
                                                         initialProperties:@{@"concurrentRoot" : @(YES)}];
        return _rootView;
    } else {
        // Current implementation to define rootview.
        _rootView = [[RCTRootView alloc] initWithBridge:_bridge
                                                         moduleName:_moduleName
                                                  initialProperties:@{}];
        return _rootView;
    }
}

- (BOOL)ah_enableNewArc {
    return YES;
}

#pragma mark - RCTTurboModuleManagerDelegate

- (Class)getModuleClassFromName:(const char *)name
{
  return RCTCoreModulesClassProvider(name);
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                      jsInvoker:(std::shared_ptr<facebook::react::CallInvoker>)jsInvoker
{
  return nullptr;
}

- (id<RCTTurboModule>)getModuleInstanceFromClass:(Class)moduleClass {
  // No custom initializer here.
  return [moduleClass new];
}


#pragma mark - RCTCxxBridgeDelegate

std::unique_ptr<facebook::react::JSExecutorFactory> RCTAppSetupDefaultJsExecutorFactory1(
    RCTBridge *bridge,
    RCTTurboModuleManager *turboModuleManager,
    std::shared_ptr<facebook::react::RuntimeScheduler> const &runtimeScheduler)
{
  // Necessary to allow NativeModules to lookup TurboModules
  [bridge setRCTTurboModuleRegistry:turboModuleManager];

#if RCT_DEV
  if (!RCTTurboModuleEagerInitEnabled()) {
    /**
     * Instantiating DevMenu has the side-effect of registering
     * shortcuts for CMD + d, CMD + i,  and CMD + n via RCTDevMenu.
     * Therefore, when TurboModules are enabled, we must manually create this
     * NativeModule.
     */
    [turboModuleManager moduleForName:"RCTDevMenu"];
  }
#endif

#if RCT_USE_HERMES
  return std::make_unique<facebook::react::HermesExecutorFactory>(
#else
  return std::make_unique<facebook::react::JSCExecutorFactory>(
#endif
      facebook::react::RCTJSIExecutorRuntimeInstaller(
          [turboModuleManager, bridge, runtimeScheduler](facebook::jsi::Runtime &runtime) {
            if (!bridge || !turboModuleManager) {
              return;
            }
            if (runtimeScheduler) {
              facebook::react::RuntimeSchedulerBinding::createAndInstallIfNeeded(runtime, runtimeScheduler);
            }
            facebook::react::RuntimeExecutor syncRuntimeExecutor =
                [&](std::function<void(facebook::jsi::Runtime & runtime_)> &&callback) { callback(runtime); };
            [turboModuleManager installJSBindingWithRuntimeExecutor:syncRuntimeExecutor];
          }));
}


std::unique_ptr<facebook::react::JSExecutorFactory> RCTAppSetupJsExecutorFactoryForOldArch1(
    RCTBridge *bridge,
    std::shared_ptr<facebook::react::RuntimeScheduler> const &runtimeScheduler)
{
  return std::make_unique<facebook::react::JSCExecutorFactory>(
      facebook::react::RCTJSIExecutorRuntimeInstaller([bridge, runtimeScheduler](facebook::jsi::Runtime &runtime) {
        if (!bridge) {
          return;
        }
        if (runtimeScheduler) {
          facebook::react::RuntimeSchedulerBinding::createAndInstallIfNeeded(runtime, runtimeScheduler);
        }
      }));
}

- (std::unique_ptr<facebook::react::JSExecutorFactory>)jsExecutorFactoryForBridge:(RCTBridge *)bridge
{
  // Add these lines to create a TurboModuleManager
    if ([self ah_enableNewArc]) {
        
        _runtimeScheduler = std::make_shared<facebook::react::RuntimeScheduler>(RCTRuntimeExecutorFromBridge(bridge));
        std::shared_ptr<facebook::react::CallInvoker> callInvoker =
            std::make_shared<facebook::react::RuntimeSchedulerCallInvoker>(_runtimeScheduler);
        
        self.turboModuleManager = [[RCTTurboModuleManager alloc] initWithBridge:bridge delegate:self jsInvoker:callInvoker];
        
        _contextContainer->erase("RuntimeScheduler");
        _contextContainer->insert("RuntimeScheduler", _runtimeScheduler);
        
        return RCTAppSetupDefaultJsExecutorFactory1(bridge, self.turboModuleManager, _runtimeScheduler);
        
        if (RCTTurboModuleEnabled()) {
          _turboModuleManager = [[RCTTurboModuleManager alloc] initWithBridge:bridge
                                                   delegate:self
                                                  jsInvoker:bridge.jsCallInvoker];

          // Necessary to allow NativeModules to lookup TurboModules
          [bridge setRCTTurboModuleRegistry:_turboModuleManager];

          if (!RCTTurboModuleEagerInitEnabled()) {
            /**
             * Instantiating DevMenu has the side-effect of registering
             * shortcuts for CMD + d, CMD + i,  and CMD + n via RCTDevMenu.
             * Therefore, when TurboModules are enabled, we must manually create this
             * NativeModule.
             */
             [_turboModuleManager moduleForName:"DevMenu"];
          }
        }

        // Add this line...
        __weak __typeof(self) weakSelf = self;

        // If you want to use the `JSCExecutorFactory`, remember to add the `#import <React/JSCExecutorFactory.h>`
        // import statement on top.
        return std::make_unique<facebook::react::JSCExecutorFactory>(
          facebook::react::RCTJSIExecutorRuntimeInstaller([weakSelf, bridge](facebook::jsi::Runtime &runtime) {
            if (!bridge) {
              return;
            }

            // And add these lines to install the bindings...
            __typeof(self) strongSelf = weakSelf;
            if (strongSelf) {
              facebook::react::RuntimeExecutor syncRuntimeExecutor =
                  [&](std::function<void(facebook::jsi::Runtime & runtime_)> &&callback) { callback(runtime); };
              [strongSelf->_turboModuleManager installJSBindingWithRuntimeExecutor:syncRuntimeExecutor];
            }
          }));
    } else {
        _runtimeScheduler = std::make_shared<facebook::react::RuntimeScheduler>(RCTRuntimeExecutorFromBridge(bridge));
        return RCTAppSetupJsExecutorFactoryForOldArch1(bridge, _runtimeScheduler);
//        return std::make_unique<facebook::react::JSCExecutorFactory>(
//             facebook::react::RCTJSIExecutorRuntimeInstaller([bridge, runtimeScheduler](facebook::jsi::Runtime &runtime) {
//               if (!bridge) {
//                 return;
//               }
//               if (_runtimeScheduler) {
//                 facebook::react::RuntimeSchedulerBinding::createAndInstallIfNeeded(runtime, runtimeScheduler);
//               }
//             }));
    }
}

#pragma mark - RCTBridgeDelegate

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
    NSURL *RO = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
    RO = [NSURL URLWithString:@"http://10.168.13.27:8081/index.bundle?platform=ios&dev=true&minify=false"];
  return RO;
#else
  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

@end
