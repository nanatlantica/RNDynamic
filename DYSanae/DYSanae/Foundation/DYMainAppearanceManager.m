//
//  DYMainAppearanceManager.m
//  DYSanae
//
//  Created by DongYi on 2022/1/19.
//

#import "DYMainAppearanceManager.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DYCommonTools.h"

@implementation DYMainAppearanceManager

+ (void)initCommonAppearances {
    [UITabBar appearance].tintColor = UIColorFromRGB(0xffffff);
    [UITabBar appearance].barTintColor = UIColorFromRGB(0xffffff);
    [UITabBar appearance].backgroundColor = UIColorFromRGB(0xff5046);
    [UITabBar appearance].translucent = NO;
//    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0xff5046), NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateSelected];
//    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0x333333), NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateNormal];
}

@end
