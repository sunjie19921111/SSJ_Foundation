//
//  SSJScaleManager.m
//  UIKit
//
//  Created by 孙杰 on 2019/12/6.
//  Copyright © 2019 qhwr. All rights reserved.
//

#import "SSJScaleManager.h"

@interface SSJScaleManager ()

@property (nonatomic, assign) CGFloat standardWidth;

@end

@implementation SSJScaleManager

+ (instancetype)sharedSacle {
    static SSJScaleManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[SSJScaleManager alloc] init];
    });
    return manager;
}

- (instancetype)init {
    if (self = [super init]) {
        _type = SSJScaleSizeTypeiPhone6;
    }
    return self;
}

- (void)setType:(SSJScaleSizeType)type {
    switch (type) {
        case SSJScaleSizeTypeiPhone4:
            _standardWidth = 320.0;
            break;
        case SSJScaleSizeTypeiPhone5:
            _standardWidth = 320.0;
        case SSJScaleSizeTypeiPhone6:
            _standardWidth = 375.0;
        case SSJScaleSizeTypeiPhone6P:
             _standardWidth = 414.0;
        case SSJScaleSizeTypeiPhoneX:
             _standardWidth = 375.0;
        case SSJScaleSizeTypeiPhoneXR:
             _standardWidth = 414.0;
        case SSJScaleSizeTypeiPhoneXS:
            _standardWidth = 375.0;
        case SSJScaleSizeTypeiPhoneXSMax:
            _standardWidth = 414.0;
        default:
            break;
    }
}

- (CGFloat)currentScreenWidth {
    return [UIScreen mainScreen].bounds.size.width;
}

- (CGFloat)normalScale {
    CGFloat currentWidth = [self currentScreenWidth];
    return self.standardWidth / currentWidth;
}

@end
