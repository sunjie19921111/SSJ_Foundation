//
//  UILabel+SSJAdd.m
//  UIKit
//
//  Created by 孙杰 on 2019/12/6.
//  Copyright © 2019 qhwr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UILabel+SSJAdd.h"
#import <objc/runtime.h>

@interface UILabel ()

@property (nonatomic, strong) UILongPressGestureRecognizer *longPressGestureRecognizer;

@end

@implementation UILabel (SSJAdd)

- (BOOL)canBecomeFirstResponder {
    return self.copyingEnabled;
}

- (UILongPressGestureRecognizer *)longPressGestureRecognizer {
    return objc_getAssociatedObject(self, @selector(longPressGestureRecognizer));
}

- (void)setLongPressGestureRecognizer:(UILongPressGestureRecognizer *)longPressGestureRecognizer {
    objc_setAssociatedObject(self, @selector(longPressGestureRecognizer), longPressGestureRecognizer, OBJC_ASSOCIATION_RETAIN);
}

- (void)setCopyingEnabled:(BOOL)copyingEnabled {
    if (self.copyingEnabled != copyingEnabled) {
        objc_setAssociatedObject(self, @selector(copyingEnabled), @(copyingEnabled), OBJC_ASSOCIATION_RETAIN);
        [self buildLongPressGestureRecognizer];
    }
}

- (BOOL)copyingEnabled {
    return objc_getAssociatedObject(self, @selector(copyingEnabled));
}

- (void)onLongPressGestureRecognizer:(UILongPressGestureRecognizer *)longPressGestureRecognizer {
    if (longPressGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        [self buildMenuControlle];
    }
}

- (void)clickCopyingEnabled:(id)sender {
    if (self.copyingEnabled) {
        UIPasteboard *pastedoard = [UIPasteboard generalPasteboard];
        [pastedoard setString:self.text];
    }
}

- (void)buildMenuControlle {
    UIMenuItem *menuItem = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(clickCopyingEnabled:)];
    UIMenuController *menu = [UIMenuController sharedMenuController];
    menu.menuItems = @[menuItem];
//    [menu showMenuFromView:self rect:self.bounds];
    [menu setArrowDirection:UIMenuControllerArrowDefault];
    [menu setMenuVisible:YES animated:YES];
}

- (void)buildLongPressGestureRecognizer {
    self.userInteractionEnabled = YES;
    if (self.copyingEnabled) {
        return;
    }
    self.longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(onLongPressGestureRecognizer:)];
    [self addGestureRecognizer:self.longPressGestureRecognizer];
    
}

@end
