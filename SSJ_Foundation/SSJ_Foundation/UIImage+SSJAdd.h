//
//  UIImage+SSJAdd.h
//  UIKit
//
//  Created by 孙杰 on 2019/12/6.
//  Copyright © 2019 qhwr. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SSJImageScaleMode) {
    SSJImageScaleModeFill = 0,
    SSJImageScaleModeAspectFit = 1,
    SSJImageScaleModeAspectFill = 2
};

typedef UIRectCorner SSJRectCorner;

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (SSJAdd)

+ (UIImage *)ssj_imageWithColor:(UIColor *)color;

- (nullable UIImage *)ssj_roundedCornerImageWithRadius:(CGFloat)cornerRadius corners:(SSJRectCorner)corners borderWidth:(CGFloat)borderWidth borderColor:(nullable UIColor *)borderColor;

@end

NS_ASSUME_NONNULL_END
