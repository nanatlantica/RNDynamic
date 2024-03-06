//
//  DYTestingTableViewCell.h
//  DYSanae
//
//  Created by DongYi on 2022/1/25.
//

#import "DYBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@class DYTestingTableViewCell;

@protocol DYTestingTableViewCellDelegate <NSObject>

@required
- (void)testingMenuCellLongPressed:(DYTestingTableViewCell *)cell;

@end

@interface DYTestingTableViewCell : DYBaseTableViewCell

@property (nonatomic, weak) id<DYTestingTableViewCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
