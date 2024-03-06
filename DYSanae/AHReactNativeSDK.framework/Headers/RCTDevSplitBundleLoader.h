/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "RCTBridgeModule.h"
#import "RCTJSScriptLoaderModule.h"
#import <UIKit/UIKit.h>

@interface RCTDevSplitBundleLoader : NSObject <RCTBridgeModule, RCTJSScriptLoaderModule>
@end
