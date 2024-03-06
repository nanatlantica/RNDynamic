//
//  AHRNLinearGradientManager.m
//  AHRNComponentsFramework
//
//  Created by uhou on 12/03/2018.
//  Copyright © 2018 Autohome. All rights reserved.
//

#import "AHRNLinearGradientManager.h"
#import "AHRNLinearGradientImpl.h"
#import <React/RCTUIManager.h>


@implementation AHRNLinearGradientManager

RCT_EXPORT_MODULE(AHRNLinearGradient)
RCT_EXPORT_VIEW_PROPERTY(colors, NSArray);
RCT_EXPORT_VIEW_PROPERTY(start, NSArray);
RCT_EXPORT_VIEW_PROPERTY(end, NSArray);
RCT_EXPORT_VIEW_PROPERTY(locations, NSArray);
RCT_EXPORT_VIEW_PROPERTY(opacity, CGFloat);
RCT_EXPORT_VIEW_PROPERTY(borderRadii, NSArray);


- (UIView *)view {
    return [[AHRNLinearGradientImpl alloc] init];
}

- (dispatch_queue_t)methodQueue {
  return dispatch_get_main_queue();
}

@end
