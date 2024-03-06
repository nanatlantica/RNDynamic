//
//  DYTestingTableViewCell.m
//  DYSanae
//
//  Created by DongYi on 2022/1/25.
//

#import "DYTestingTableViewCell.h"
#import "DYBaseLabel.h"

@interface DYTestingTableViewCell ()

@property (nonatomic, strong) DYBaseLabel *label;

@end

@implementation DYTestingTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self initControls];
        [self addLongPressGesture];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Gesture

- (void)addLongPressGesture {
    UILongPressGestureRecognizer *reco = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(didLongPressCell:)];
    [self addGestureRecognizer:reco];
}

- (IBAction)didLongPressCell:(id)sender {
    if ([_delegate respondsToSelector:@selector(testingMenuCellLongPressed:)]) {
        [_delegate testingMenuCellLongPressed:self];
    }
}

#pragma mark - Superclass

- (void)reloadData {
    if (!self.model) {
        //mock数据
        UIListContentConfiguration *content = self.defaultContentConfiguration;
        content.text = [NSString stringWithFormat:@"测试cell %d", self.index];
        self.contentConfiguration = content;
        
    } else {
        UIListContentConfiguration *content = self.defaultContentConfiguration;
        content.text = [NSString stringWithFormat:@"测试cell %d", self.index];
        self.contentConfiguration = content;
    }
}

- (void)initControls {
    
}

@end
