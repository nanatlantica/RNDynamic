//
//  DYBaseTableView.m
//  DYSanae
//
//  Created by DongYi on 2022/1/21.
//

#import "DYBaseTableView.h"
#import "DYCommonTools.h"
#import "DYBaseTableViewCell.h"

@implementation DYBaseTableView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupTableView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupTableView];
    }
    return self;
}

- (void)setupTableView {
    self.backgroundColor = UIColorFromRGB(0xeeeeee);
    self.separatorColor = UIColorFromRGB(0xdddddd);
}

@end
