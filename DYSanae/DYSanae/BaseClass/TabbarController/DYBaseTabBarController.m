//
//  DYBaseTabBarController.m
//  DYSanae
//
//  Created by DongYi on 2022/1/18.
//

#import "DYBaseTabBarController.h"
#import "DYBaseViewController.h"

@interface DYBaseTabBarController ()

@end

@implementation DYBaseTabBarController

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setupChildVC:(DYBaseViewController *)vc
               title:(NSString *)title
            andImage:(NSString *)image
      andSelectImage:(NSString *)selectImage {
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:vc];
}

@end
