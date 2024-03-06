//
//  AHRNLinearGradient.m
//  AHRNComponentsFramework
//
//  Created by uhou on 12/03/2018.
//  Copyright © 2018 Autohome. All rights reserved.
//

#import "AHRNLinearGradient.h"
#import <react/renderer/components/AHReactNativeSDKSpec/ComponentDescriptors.h>
#import <react/renderer/components/AHReactNativeSDKSpec/EventEmitters.h>
#import <react/renderer/components/AHReactNativeSDKSpec/Props.h>
#import <react/renderer/components/AHReactNativeSDKSpec/RCTComponentViewHelpers.h>
#import <React-RCTFabric/React/RCTFabricComponentsPlugins.h>

#import <React/RCTConvert.h>

using namespace facebook::react;

@interface  AHRNLinearGradient () <RCTAHRNLinearGradientViewProtocol>

@property (nonatomic, copy) NSArray *borderRadii;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong) UIView *maskView;

@end

@implementation AHRNLinearGradient

+ (ComponentDescriptorProvider)componentDescriptorProvider {
  return concreteComponentDescriptorProvider<AHRNLinearGradientComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const AHRNLinearGradientProps>();
    _props = defaultProps;
    
    _maskView = [[UIView alloc] initWithFrame:frame];
    [_maskView setBackgroundColor:[UIColor clearColor]];
    [_maskView.layer addSublayer:self.gradientLayer];
    [self addSubview:_maskView];
  }
  return self;
}

- (void)updateProps:(const Props::Shared &)props oldProps:(const Props::Shared &)oldProps {
  const auto &oldViewProps = *std::static_pointer_cast<AHRNLinearGradientProps const>(_props);
  const auto &newViewProps = *std::static_pointer_cast<AHRNLinearGradientProps const>(props);
  
  NSMutableArray *colors = [NSMutableArray arrayWithCapacity:newViewProps.colors.size()];
  for (auto it : newViewProps.colors) {
    CGColorRef color = [RCTConvert CGColor:@(it)];
    [colors addObject:(__bridge id)color];
  }
  self.gradientLayer.colors = colors;
//  self.gradientLayer.colors = @[(__bridge  id)[UIColor redColor].CGColor, (__bridge  id)[UIColor yellowColor].CGColor, (__bridge  id)[UIColor blueColor].CGColor];
  self.gradientLayer.startPoint = CGPointMake(newViewProps.start[0], newViewProps.start[1]);
  self.gradientLayer.endPoint = CGPointMake(newViewProps.end[0], newViewProps.end[1]);
  NSMutableArray *locations = [NSMutableArray arrayWithCapacity:newViewProps.locations.size()];
  for (auto it : newViewProps.locations) {
    [locations addObject:@(it)];
  }
  self.gradientLayer.locations = locations;
  self.gradientLayer.opacity = newViewProps.opacity;
  //self.borderRadii = newViewProps.borderRadii;
  
  [super updateProps:props oldProps:oldProps];
}

- (void)layoutSubviews {
  [super layoutSubviews];
  
  _maskView.frame = self.bounds;
  if (self.borderRadii.count > 0) {
    //这个视图将Layer改成了CAGradientLayer，导致原先的圆角不生效，现在通过添加圆角Layer来解决
    CGFloat cornerRadius = 0;
    UIRectCorner corner = 0;
    for (int i = 0; i < self.borderRadii.count; i++) {
      NSNumber *radius = self.borderRadii[i];
      if (radius.floatValue > 0) {
        if (cornerRadius == 0) {
          cornerRadius = radius.floatValue;
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
        corner |= rectCorner;
      }
    }
    // 设置大小
    self.shapeLayer.frame = self.bounds;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.shapeLayer.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    // 设置圆形样子
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

extern "C" {

Class<RCTComponentViewProtocol> AHRNLinearGradientCls(void) {
  return AHRNLinearGradient.class;
}

}
