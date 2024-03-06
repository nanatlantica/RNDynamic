//
//  DYBaseView.m
//  DYSanae
//
//  Created by DongYi on 2022/1/20.
//

#import "DYBaseView.h"

@implementation DYBaseView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

+ (instancetype)view {
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:[self description] owner:self options:nil];
    for (id oneObject in nib) {
        if ([oneObject isKindOfClass:self]) {
            return oneObject;
        }
    }
    return nil;
}

@end
