//
//  AHRNLinearGradientImpl.m
//  AwesomeProject
//
//  Created by DongYi on 2024/2/28.
//

#import "AHRNLinearGradientImpl.h"
#import <React/RCTConvert.h>

@interface  AHRNLinearGradientImpl ()

@property (nonatomic, copy) NSArray *borderRadii;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong) UIView *maskView;

@end

@implementation AHRNLinearGradientImpl

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _maskView = [[UIView alloc] initWithFrame:self.bounds];
        [_maskView setBackgroundColor:[UIColor clearColor]];
        [_maskView.layer addSublayer:self.gradientLayer];
        [self addSubview:_maskView];
    }
    return self;
}

- (void)setColors:(NSArray *)colorStrings {
    NSMutableArray *colors = [NSMutableArray arrayWithCapacity:colorStrings.count];
    for (NSString *colorString in colorStrings) {
        [colors addObject:(id)[RCTConvert UIColor:colorString].CGColor];
    }
    self.gradientLayer.colors = colors;
}

- (void)setStart:(CGPoint)startPoint {
    self.gradientLayer.startPoint = startPoint;
}

- (void)setEnd:(CGPoint)endPoint {
    self.gradientLayer.endPoint = endPoint;
}

- (void)setLocations:(NSArray *)locations {
    self.gradientLayer.locations = locations;
}

- (void)setAlphaValue:(NSNumber *)alphaValue {
    self.gradientLayer.opacity = [alphaValue floatValue];
}

- (void)setBorderRadii:(NSArray *)borderRadii {
    _borderRadii = borderRadii;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _maskView.frame = self.bounds;
    if (self.borderRadii.count > 0) {
        //这个视图将Layer改成了CAGradientLayer，导致原先的圆角不生效，现在通过添加圆角Layer来解决
        CGFloat cornerRadius = 0;
        UIRectCorner corner=0;
        for (int i=0; i<self.borderRadii.count; i++) {
            NSNumber *radiu = self.borderRadii[i];
            if (radiu.floatValue > 0) {
                if (cornerRadius == 0) {
                    cornerRadius = radiu.floatValue;
                }
                UIRectCorner rectCorner;
                switch (i) {
                    case 0:
                        rectCorner = UIRectCornerTopLeft;
                        break;
                    case 1:
                        rectCorner = UIRectCornerTopRight;
                        break;
                    case 2:
                        rectCorner = UIRectCornerBottomLeft;
                        break;
                    case 3:
                        rectCorner = UIRectCornerBottomRight;
                        break;
                    default:
                        rectCorner = UIRectCornerAllCorners;
                        break;
                }
                corner = corner|rectCorner;
            }
        }
        //设置大小
        self.shapeLayer.frame = self.bounds;
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.shapeLayer.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        //设置图形样子
        self.shapeLayer.path = maskPath.CGPath;
        self.gradientLayer.mask = self.shapeLayer;
    }
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.gradientLayer.frame = self.bounds;
    [CATransaction commit];
    
}

- (CAGradientLayer *)gradientLayer {
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
    }
    return _gradientLayer;
}

- (CAShapeLayer *)shapeLayer {
    if (!_shapeLayer) {
        _shapeLayer = [CAShapeLayer layer];
    }
    return _shapeLayer;
}

@end
