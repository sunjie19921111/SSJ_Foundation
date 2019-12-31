//
//  UIView+SSJAdd.m
//  UIKit
//
//  Created by 孙杰 on 2019/12/6.
//  Copyright © 2019 qhwr. All rights reserved.
//

#import "UIView+SSJAdd.h"
#import "SSJScaleManager.h"

@implementation UIView (SSJAdd)

- (void)setSsj_left:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)ssj_left {
    return self.frame.origin.x;
}

- (void)setSsj_top:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)ssj_top {
    return self.frame.origin.y;
}

- (void)setSsj_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)ssj_width {
    return self.frame.size.width;
}

- (void)setSsj_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)ssj_height {
    return self.frame.size.height;
}

- (instancetype)ssj_initWithFrame:(CGRect)frame {
    return [self initWithFrame:CGRectMake(self.ssj_left * kNormalScale, self.ssj_top * kNormalScale, self.ssj_width * kNormalScale, self.ssj_height * kNormalScale)];
}

- (CGRect)ssj_frame {
    return CGRectMake(self.ssj_left * kNormalScale, self.ssj_top * kNormalScale, self.ssj_width * kNormalScale, self.ssj_height * kNormalScale);
}

@end
