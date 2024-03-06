//
//  DYMenuTestingViewController.m
//  DYSanae
//
//  Created by DongYi on 2022/1/23.
//

#import "DYTestingMenuViewController.h"

@interface DYTestingMenuViewController ()

@end

@implementation DYTestingMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addLongPressGesture];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //Attention:didAppear之后设置第一响应者才可生效
    [self becomeFirstResponder];
}

- (void)addLongPressGesture {
    UILongPressGestureRecognizer *rec = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(showMenu)];
    [self.view addGestureRecognizer:rec];
}

- (void)showMenu {
    UIMenuController *menu = [UIMenuController sharedMenuController];
    
    UIMenuItem *item1 = [[UIMenuItem alloc] initWithTitle:@"标题1" action:@selector(menuAction1)];
    UIMenuItem *item2 = [[UIMenuItem alloc] initWithTitle:@"标题2" action:@selector(menuAction2)];
    UIMenuItem *item3 = [[UIMenuItem alloc] initWithTitle:@"标题3" action:@selector(menuAction3)];
    
    menu.menuItems = @[item1, item2, item3];
    
    CGRect targetRect = CGRectMake(200, 200, 100, 100);
    [menu setTargetRect:targetRect inView:self.view];
    
    [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
}

- (void)menuAction1 {
    
}

- (void)menuAction2 {
    
}

- (void)menuAction3 {
    
}

/**
 * 说明控制器可以成为第一响应者
 * 因为控制器是因为比较特殊的对象,它找控制器的方法,不找label的方法
 */
- (BOOL)canBecomeFirstResponder
{
    return YES;
}

/**
 * 通过这个方法告诉UIMenuController它内部应该显示什么内容
 * 返回YES，就代表支持action这个操作
 */
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    //打印, 将一个方法转换成字符串 你就会看到许多方法
//    NSLog(@"%@",NSStringFromSelector(action));
//
       if (action == @selector(menuAction1)
        || action == @selector(menuAction2)
        || action == @selector(menuAction3)) {
        return YES;
    }
    
    return NO;
}

@end
