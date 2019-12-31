//
//  UIFont+SSJAdd.m
//  UIKit
//
//  Created by 孙杰 on 2019/12/6.
//  Copyright © 2019 qhwr. All rights reserved.
//

#import "UIFont+SSJAdd.h"
#import "SSJScaleManager.h"

@implementation UIFont (SSJAdd)

+ (UIFont *)ssj_systemFontOfSize:(CGFloat)fontSize {
    return [UIFont systemFontOfSize:fontSize * kNormalScale];
}
+ (UIFont *)ssj_boldSystemFontOfSize:(CGFloat)fontSize {
    return [UIFont boldSystemFontOfSize:fontSize * kNormalScale];
}

+ (UIFont *)ssj_fontWithName:(NSString *)fontName size:(CGFloat)fontSize {
    return [UIFont fontWithName:fontName size:fontSize * kNormalScale];
}

@end
