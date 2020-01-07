//
//  UIAlertView+SSJAdd.h
//  UIKit
//
//  Created by 孙杰 on 2019/12/6.
//  Copyright © 2019 qhwr. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^AlertBlock)(NSInteger);

@interface UIAlertView (SSJAdd)

- (void)ssj_howAlertWithCompletionHandler: (void (^)(NSInteger))block;
- (void)ssj_clearActionBlock;

@end

NS_ASSUME_NONNULL_END
