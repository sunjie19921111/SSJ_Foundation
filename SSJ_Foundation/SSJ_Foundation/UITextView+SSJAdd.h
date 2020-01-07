//
//  UITextView+SSJAdd.h
//  UIKit
//
//  Created by 孙杰 on 2019/12/6.
//  Copyright © 2019 qhwr. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (SSJAdd)

@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) UILabel  *placeholderLabel;
@property (nonatomic, strong) UIColor  *placeholderLabelColor;
@property (nonatomic, strong) NSString *textValue;

@end

NS_ASSUME_NONNULL_END
