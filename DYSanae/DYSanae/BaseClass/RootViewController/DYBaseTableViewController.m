//
//  DYBaseTableViewController.m
//  DYSanae
//
//  Created by DongYi on 2022/1/20.
//

#import "DYBaseTableViewController.h"
#import "DYBaseTableViewCell.h"

@interface DYBaseTableViewController ()

@end

@implementation DYBaseTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _tableView = [[DYBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _dataArray = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.frame = [[UIScreen mainScreen] bounds];
    _tableView.frame = self.view.frame;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[self classForCell] forCellReuseIdentifier:[self cellIdentifier]];
    [self.view addSubview:_tableView];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

#pragma mark - Public Methods
- (void)loadDataWithSuccess:(void(^)(NSArray *dataArray))success offset:(NSInteger)offset limit:(NSInteger)limit {
    NSString *subclassNeedImplementThisMethod = nil;
    NSParameterAssert(subclassNeedImplementThisMethod);
}

- (Class)classForCell {
    NSString *subclassNeedImplementThisMethod = nil;
    NSParameterAssert(subclassNeedImplementThisMethod);
    return [UITableViewCell class];
}

- (void)refresh {
    [_tableView reloadData];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //是否需要高度缓存
    return 44.0f;
}

#pragma mark - UITableViewDataSource
- (NSString *)cellIdentifier {
    return NSStringFromClass([self classForCell]);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DYBaseTableViewCell *cell = (DYBaseTableViewCell *)[tableView dequeueReusableCellWithIdentifier:[self cellIdentifier] forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    cell.index = indexPath.row;
    [cell reloadData];
    return cell;
}

@end
