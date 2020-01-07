//
//  UIButton+SSJAdd.m
//  UIKit
//
//  Created by 孙杰 on 2019/12/6.
//  Copyright © 2019 qhwr. All rights reserved.
//

#import "UIButton+SSJAdd.h"
#import <objc/runtime.h>

#define DEFAULT_INTERVAL 0.1  //Default time interval

@interface UIButton ()

/**
 Ignore repeat clicks, YES - ignore repeat clicks, NO - do not ignore repeat clicks
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
        self.sjj_timeInterval = self.sjj_timeInterval == 0 ? DEFAULT_INTERVAL : self.sjj_timeInterval;
        if (self.isIgnoreEvent) return;
        if (self.sjj_timeInterval > 0) {
            [self performSelector:@selector(changeIgnoreState) withObject:self afterDelay:self.sjj_timeInterval];
        }
        
    }
    self.isIgnoreEvent = YES;
    [self heSendAction:action to:target forEvent:event];
}

- (void)changeIgnoreState {
    [self setIsIgnoreEvent:NO];
}

- (void)setSjj_timeInterval:(NSTimeInterval)sjj_timeInterval {
    objc_setAssociatedObject(self, @selector(sjj_timeInterval), @(sjj_timeInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)sjj_timeInterval {
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}


- (void)setIsIgnoreEvent:(BOOL)isIgnoreEvent {
    objc_setAssociatedObject(self, @selector(isIgnoreEvent), @(isIgnoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isIgnoreEvent {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}



@end
