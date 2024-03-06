//
//  AHRNStringToolsModule.m
//  AHRNComponentsFramework
//
//  Created by 李翔宇 on 2018/1/17.
//  Copyright © 2018年 Autohome. All rights reserved.
//

#import "AHRNStringToolsModule.h"
#import "RCTBridge.h"

@implementation AHRNStringToolsModule

RCT_EXPORT_MODULE();

#pragma mark - 导出函数

/**
 普通Toast。使用默认配置
 */
RCT_EXPORT_METHOD(hanziToPinyin:(NSString *)hanzi callback:(RCTResponseSenderBlock)callback) {
  NSLog(@"%@", self.bridge.launchOptions);
  
    NSString *hanziM = [NSMutableString stringWithString:hanzi];
    CFStringTransform((CFMutableStringRef)hanziM, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)hanziM, NULL, kCFStringTransformStripDiacritics, NO);
    NSString *pinyin = [hanziM copy];
    callback(@[pinyin]);
}

@end
