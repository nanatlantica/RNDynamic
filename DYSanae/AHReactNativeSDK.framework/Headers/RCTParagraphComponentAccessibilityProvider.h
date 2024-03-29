/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import <UIKit/UIKit.h>

#import "AttributedString.h"
#import "ParagraphAttributes.h"
#import "RCTTextLayoutManager.h"

#import "RCTParagraphComponentView.h"

@interface RCTParagraphComponentAccessibilityProvider : NSObject

- (instancetype)initWithString:(facebook::react::AttributedString)attributedString
                 layoutManager:(RCTTextLayoutManager *)layoutManager
           paragraphAttributes:(facebook::react::ParagraphAttributes)paragraphAttributes
                         frame:(CGRect)frame
                          view:(UIView *)view;

/*
 * Returns an array of `UIAccessibilityElement`s to be used for `UIAccessibilityContainer` implementation.
 */
- (NSArray<UIAccessibilityElement *> *)accessibilityElements;

/**
 @abstract To make sure the provider is up to date.
*/
- (BOOL)isUpToDate:(facebook::react::AttributedString)currentAttributedString;

@end
