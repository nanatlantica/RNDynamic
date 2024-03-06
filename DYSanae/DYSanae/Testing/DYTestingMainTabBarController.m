//
//  DYTestingMainTabBarController.m
//  DYSanae
//
//  Created by DongYi on 2022/1/24.
//

#import "DYTestingMainTabBarController.h"
#import "DYBaseViewController.h"
#import "DYTestingMenuViewController.h"
#import "DYTestingTableMenuViewController.h"

@interface DYTestingMainTabBarController ()

@end

@implementation DYTestingMainTabBarController

- (instancetype)init {
    self = [super init];
    if (self) {
        DYTestingTableMenuViewController *vc1 = [[DYTestingTableMenuViewController alloc] init];
        NSMutableArray *ary = [[NSMutableArray alloc] init];
        for (int i = 0; i < 500; i++) {
            [ary addObject:[NSNumber numberWithInt:i]];
        }
        vc1.dataArray = ary;
        [self setupChildVC:vc1 title:@"列表" andImage:@"tab_icon1" andSelectImage:@"tab_icon2"];
        
        DYTestingMenuViewController *vc2 = [[DYTestingMenuViewController alloc] init];
        [self setupChildVC:vc2 title:@"菜单" andImage:@"tab_icon1" andSelectImage:@"tab_icon2"];
        
        DYBaseViewController *vc3 = [[DYBaseViewController alloc] init];
        [self setupChildVC:vc3 title:@"预留" andImage:@"tab_icon1" andSelectImage:@"tab_icon2"];
        
        DYBaseViewController *vc4 = [[DYBaseViewController alloc] init];
        [self setupChildVC:vc4 title:@"预留" andImage:@"tab_icon1" andSelectImage:@"tab_icon2"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupChildVC:(NSString * )title andImage:(NSString * )image andSelectImage:(NSString *)selectImage {
    DYTestingTableMenuViewController *vc = [[DYTestingTableMenuViewController alloc] init];
    NSMutableArray *ary = [[NSMutableArray alloc] initWithCapacity:1000];
    for (int i = 0; i < 500; i++) {
        [ary addObject:[NSNumber numberWithInt:i]];
    }
    vc.dataArray = ary;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:vc];
}

@end
