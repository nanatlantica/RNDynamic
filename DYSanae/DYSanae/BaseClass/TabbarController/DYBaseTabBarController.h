//
//  DYBaseTabBarController.h
//  DYSanae
//
//  Created by DongYi on 2022/1/18.
//

#import <UIKit/UIKit.h>
#import "DYBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DYBaseTabBarController : UITabBarController

- (void)setupChildVC:(DYBaseViewController *)vc
               title:(NSString * )title
            andImage:(NSString * )image
      andSelectImage:(NSString *)selectImage;

@end

NS_ASSUME_NONNULL_END
