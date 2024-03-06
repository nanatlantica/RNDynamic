//
//  DYBaseTableViewController.h
//  DYSanae
//
//  Created by DongYi on 2022/1/20.
//

#import "DYBaseViewController.h"
#import "DYBaseTableView.h"
#import "DYBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface DYBaseTableViewController : DYBaseViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) DYBaseTableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

- (NSString *)cellIdentifier;

/**
 *  Cell class.
 *
 *  @discussion Subclass MUST override this method, cell MUST be KTVSimpleTableViewCell subclass
 *
 *  @return cell type
 */
- (Class)classForCell;

/**
 *  Load data for UITableView
 *
 *  @discussion Subclass MUST override this method.
 *
 *  @param success dataArray for dataSource
 */
- (void)loadDataWithSuccess:(void(^)(NSArray *dataArray))success offset:(NSInteger)offset limit:(NSInteger)limit;

/**
 *  Refresh tableView
 */
- (void)refresh;


@end

NS_ASSUME_NONNULL_END
