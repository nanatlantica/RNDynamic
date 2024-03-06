//
//  DYTestingTableMenuViewController.m
//  DYSanae
//
//  Created by DongYi on 2022/1/24.
//

#import "DYTestingTableMenuViewController.h"
#import "DYBaseTableView.h"
#import "DYTestingTableViewCell.h"

#import "AHRNNewArcDelegateInstance.h"

@interface DYTestingTableMenuViewController () <UITableViewDelegate, UITableViewDataSource> {
    AHRNNewArcDelegateInstance *_rnInstance;
}

@property (nonatomic, strong) DYBaseTableView *tableView;

@end

@implementation DYTestingTableMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _rnInstance = [[AHRNNewArcDelegateInstance alloc] init];
    UIView *rootView = _rnInstance.rootView;
    rootView.frame = CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height - 100);
    [self.view addSubview:rootView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //Attention:didAppear之后设置第一响应者才可生效
    [self becomeFirstResponder];
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

#pragma mark - Superclass

- (Class)classForCell {
    return [DYTestingTableViewCell class];
}

- (NSString *)cellIdentifier {
    return @"DYTestingTableViewCell";
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 88.0f;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DYTestingTableViewCell *cell = (DYTestingTableViewCell *)[tableView dequeueReusableCellWithIdentifier:[self cellIdentifier] forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    cell.delegate = self;
    cell.index = indexPath.row;
    [cell reloadData];
    return cell;
}

#pragma mark - Menu

- (void)showMenu {
    UIMenuController *menu = [UIMenuController sharedMenuController];
    
    UIMenuItem *item1 = [[UIMenuItem alloc] initWithTitle:@"标题1" action:@selector(menuAction1)];
    UIMenuItem *item2 = [[UIMenuItem alloc] initWithTitle:@"标题2" action:@selector(menuAction2)];
    UIMenuItem *item3 = [[UIMenuItem alloc] initWithTitle:@"标题3" action:@selector(menuAction3)];
    
    menu.menuItems = @[item1, item2, item3];
    
    [[UIMenuController sharedMenuController] showMenuFromView:self.view rect:CGRectMake(200, 200, 100, 100)];
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

#pragma mark - longpressDelegate

- (void)testingMenuCellLongPressed:(DYTestingTableViewCell *)cell {
    [self showMenu];
}

@end
