//
//  PTView.m
//  TouchEvent_LifeCycle
//
//  Created by pmst on 18/10/2017.
//  Copyright © 2017 pmst. All rights reserved.
//

#import "PTView.h"

IB_DESIGNABLE
@interface PTView()
@property (nonatomic, strong)IBInspectable NSString *identifier;
@end

@implementation PTView

- (void)drawRect:(CGRect)rect {
    CGSize size = [self.identifier sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14.f]}];
    [self.identifier drawInRect:CGRectMake(0, CGRectGetHeight(rect) - size.height, size.width, size.height) withAttributes: @{NSFontAttributeName : [UIFont systemFontOfSize:14.f]}];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"视图 %@ 响应了 %@ ", self.identifier,NSStringFromSelector(_cmd));
    return [super hitTest:point withEvent:event];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"视图 %@ 响应了 %@ ", self.identifier,NSStringFromSelector(_cmd));
    return [super pointInside:point withEvent:event];
}

@end
