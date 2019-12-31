//
//  UIFont+SSJAdd.h
//  UIKit
//
//  Created by 孙杰 on 2019/12/6.
//  Copyright © 2019 qhwr. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (SSJAdd)

+ (UIFont *)ssj_systemFontOfSize:(CGFloat)fontSize;
+ (UIFont *)ssj_boldSystemFontOfSize:(CGFloat)fontSize;
+ (UIFont *)ssj_fontWithName:(NSString *)fontName size:(CGFloat)fontSize;

@end

NS_ASSUME_NONNULL_END
