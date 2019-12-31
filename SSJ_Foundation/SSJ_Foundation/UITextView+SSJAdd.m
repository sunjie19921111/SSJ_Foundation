//
//  UITextView+SSJAdd.m
//  UIKit
//
//  Created by 孙杰 on 2019/12/6.
//  Copyright © 2019 qhwr. All rights reserved.
//

#import "UITextView+SSJAdd.h"
#import <objc/runtime.h>

@implementation UITextView (SSJAdd)

#define UI_PLACEHOLDER_TEXT_COLOR [UIColor colorWithRed:170.0/255.0 green:170.0/255.0 blue:170.0/255.0 alpha:1.0]
NSString const *kKeyPlaceHolder = @"kKeyPlaceHolder";
NSString const *kKeyPlaceHolderColor = @"kKeyPlaceHolderColor";
NSString const *kKeyLabel = @"kKeyLabel";

@dynamic placeholder;
@dynamic placeholderLabel;
@dynamic textValue;

- (void)setTextValue:(NSString *)textValue{
    self.text = textValue;
    [self checkIfNeedToDisplayPlaceholder];
}
- (NSString*)textValue {
    return self.text;
}

- (void)checkIfNeedToDisplayPlaceholder {
    if (self.placeholderLabel == nil)  return;
    self.placeholderLabel.hidden = (![self.text isEqualToString:@""]);
}

- (void)onTap {
    [self checkIfNeedToDisplayPlaceholder];
    [self becomeFirstResponder];
}

- (void)addPlaceholderLabelView {
    
    if (self.placeholderLabel) {
        return;
    }
    self.placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 8, 0, 0)];
    self.placeholderLabel.numberOfLines = 1;
    
    self.placeholderLabel.textColor = UI_PLACEHOLDER_TEXT_COLOR;
    self.placeholderLabel.backgroundColor = [UIColor clearColor];
    self.placeholderLabel.userInteractionEnabled = true;
    self.placeholderLabel.font = self.font;
    [self addSubview:self.placeholderLabel];
    [self.placeholderLabel sizeToFit];
}

- (void)keyPressed:(NSNotification*)notification {
    [self checkIfNeedToDisplayPlaceholder];
}

- (void)setPlaceholder:(NSString *)_placeholder {

    objc_setAssociatedObject(self, &kKeyPlaceHolder, (id)_placeholder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    [self addPlaceholderLabelView];
    self.placeholderLabel.text = _placeholder;
    
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap)]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(keyPressed:) name:UITextViewTextDidChangeNotification object:nil];
    [self checkIfNeedToDisplayPlaceholder];
}


- (void)setPlaceholderLabelColor:(UIColor *)placeholderLabelColor {
    objc_setAssociatedObject(self, &kKeyPlaceHolderColor, (id)placeholderLabelColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.placeholderLabel.textColor = placeholderLabelColor;
}

- (UIColor *)placeholderLabelColor {
    return objc_getAssociatedObject(self, &kKeyPlaceHolderColor);
}

- (NSString*)placeholder {
    return objc_getAssociatedObject(self, &kKeyPlaceHolder);
}


- (void)setPlaceholderLabel:(UILabel *)placeholderLabel {
    objc_setAssociatedObject(self, &kKeyLabel, (id)placeholderLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(keyPressed:) name:UITextViewTextDidChangeNotification object:nil];
    [self checkIfNeedToDisplayPlaceholder];
}
- (UILabel*)placeholderLabel {
    return objc_getAssociatedObject(self, &kKeyLabel);
}


@end
