//
//  UIButton+SSJAdd.m
//  UIKit
//
//  Created by 孙杰 on 2019/12/6.
//  Copyright © 2019 qhwr. All rights reserved.
//

#import "UIButton+SSJAdd.h"
#import <objc/runtime.h>

#define DEFAULT_INTERVAL 0.1  //默认时间间隔

@interface UIButton ()
/**
 是否忽视重复点击, YES - 忽视重复点击 NO - 不忽视重复点击
 */
@property (nonatomic, assign) BOOL isIgnoreEvent;

@end

@implementation UIButton (SSJAdd)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL selSystem = @selector(sendAction:to:forEvent:);
        Method methodSystem = class_getInstanceMethod(self, selSystem);
        SEL selCustom = @selector(heSendAction:to:forEvent:);
        Method methodCustom = class_getInstanceMethod(self, selCustom);
        BOOL isAdd = class_addMethod(self, selSystem, method_getImplementation(methodCustom), method_getTypeEncoding(methodCustom));
        if (isAdd) {
            class_replaceMethod(self, selCustom, method_getImplementation(methodSystem), method_getTypeEncoding(methodSystem));
        } else {
            method_exchangeImplementations(methodSystem, methodCustom);
        }
    });
}

- (void)heSendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if ([NSStringFromClass(self.class) isEqualToString:@"UIButton"]) {
        self.he_timeInterval = self.he_timeInterval == 0 ? DEFAULT_INTERVAL : self.he_timeInterval;
        if (self.isIgnoreEvent) return;
        if (self.he_timeInterval > 0) {
            [self performSelector:@selector(changeIgnoreState) withObject:self afterDelay:self.he_timeInterval];
        }
        
    }
    self.isIgnoreEvent = YES;
    [self heSendAction:action to:target forEvent:event];
}

- (void)changeIgnoreState {
    [self setIsIgnoreEvent:NO];
}

- (void)setHe_timeInterval:(NSTimeInterval)he_timeInterval {
    objc_setAssociatedObject(self, @selector(he_timeInterval), @(he_timeInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)he_timeInterval {
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}


- (void)setIsIgnoreEvent:(BOOL)isIgnoreEvent {
    objc_setAssociatedObject(self, @selector(isIgnoreEvent), @(isIgnoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isIgnoreEvent {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}



@end
