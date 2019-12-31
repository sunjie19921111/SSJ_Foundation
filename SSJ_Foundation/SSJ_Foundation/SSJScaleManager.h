//
//  SSJScaleManager.h
//  UIKit
//
//  Created by 孙杰 on 2019/12/6.
//  Copyright © 2019 qhwr. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, SSJScaleSizeType){
    SSJScaleSizeTypeiPhone4,
    SSJScaleSizeTypeiPhone5,
    SSJScaleSizeTypeiPhone6,
    SSJScaleSizeTypeiPhone6P,
    SSJScaleSizeTypeiPhoneX,
    SSJScaleSizeTypeiPhoneXR,
    SSJScaleSizeTypeiPhoneXS,
    SSJScaleSizeTypeiPhoneXSMax,
};

#define kNormalScale  [SSJScaleManager sharedSacle].normalScale

@interface SSJScaleManager : NSObject

+ (instancetype)sharedSacle;

@property (nonatomic, assign, readwrite) SSJScaleSizeType type;
@property (nonatomic, assign, readonly) CGFloat normalScale;

@end

NS_ASSUME_NONNULL_END
