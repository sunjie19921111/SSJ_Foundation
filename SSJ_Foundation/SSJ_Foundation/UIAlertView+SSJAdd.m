//
//  UIAlertView+SSJAdd.m
//  UIKit
//
//  Created by 孙杰 on 2019/12/6.
//  Copyright © 2019 qhwr. All rights reserved.
//

#import "UIAlertView+SSJAdd.h"
#import <objc/runtime.h>

static char kUIAlertViewBlockAddress;

@implementation UIAlertView (SSJAdd)

- (void)ssj_howAlertWithCompletionHandler: (void (^)(NSInteger))block {
    self.delegate = self;
    objc_setAssociatedObject(self,&kUIAlertViewBlockAddress,block,OBJC_ASSOCIATION_COPY);
    [self show];
}


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    AlertBlock block = objc_getAssociatedObject(self, &kUIAlertViewBlockAddress);
    if (block)
    {
        block(buttonIndex);
        objc_setAssociatedObject(self, &kUIAlertViewBlockAddress, nil, OBJC_ASSOCIATION_COPY);
    }
}

- (void)ssj_clearActionBlock {
    self.delegate = nil;
    objc_setAssociatedObject(self, &kUIAlertViewBlockAddress, nil, OBJC_ASSOCIATION_COPY);
}


@end
