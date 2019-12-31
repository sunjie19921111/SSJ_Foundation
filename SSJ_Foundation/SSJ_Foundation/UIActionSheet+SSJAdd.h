//
//  UIActionSheet+SSJAdd.h
//  UIKit
//
//  Created by 孙杰 on 2019/12/6.
//  Copyright © 2019 qhwr. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ActionSheetBlock)(NSInteger);

@interface UIActionSheet (SSJAdd)<UIActionSheetDelegate>

- (void)ssj_showInView: (UIView *)view completionHandler: (ActionSheetBlock)block;
- (void)ssj_clearActionBlock;

@end

NS_ASSUME_NONNULL_END
