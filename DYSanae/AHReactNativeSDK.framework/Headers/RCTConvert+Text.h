/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "RCTConvert.h"

#import "RCTTextTransform.h"

NS_ASSUME_NONNULL_BEGIN

@interface RCTConvert (Text)

+ (UITextAutocorrectionType)UITextAutocorrectionType:(nullable id)json;
+ (UITextSpellCheckingType)UITextSpellCheckingType:(nullable id)json;
+ (RCTTextTransform)RCTTextTransform:(nullable id)json;

@end

NS_ASSUME_NONNULL_END
