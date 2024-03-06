//
//  DYBaseTableViewCell.h
//  DYSanae
//
//  Created by DongYi on 2022/1/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DYBaseTableViewCell : UITableViewCell

/**
*  Index for cell in table view.
*/
@property (nonatomic) NSUInteger index;
/**
*  Model object for cell. MTLModel subclass is preferred, NSDictionary objcect for legancy code.
*/
@property (nonatomic, strong) id model;
/**
*  Subclass MUST override this method.
*/
- (void)reloadData;
- (void)initControls;
/**
*  Calculate height for given model object. Subclass MUST override this method.
*
*  @param model
*
*  @return Height for given model object
*/
+ (NSNumber *)heightForModel:(id)model;

@end

NS_ASSUME_NONNULL_END
