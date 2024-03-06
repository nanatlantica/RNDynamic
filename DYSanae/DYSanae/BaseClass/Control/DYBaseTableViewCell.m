//
//  DYBaseTableViewCell.m
//  DYSanae
//
//  Created by DongYi on 2022/1/25.
//

#import "DYBaseTableViewCell.h"

@implementation DYBaseTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)reloadData {
    [NSException raise:@"DYMethodNotImplementedException" format:@"Subclass has to implement this method"];
}

- (void)initControls {
    [NSException raise:@"DYMethodNotImplementedException" format:@"Subclass has to implement this method"];
}

+ (NSNumber *)heightForModel:(id)model {
    [NSException raise:@"DYMethodNotImplementedException" format:@"Subclass has to implement this method"];
    return nil;
}

@end
