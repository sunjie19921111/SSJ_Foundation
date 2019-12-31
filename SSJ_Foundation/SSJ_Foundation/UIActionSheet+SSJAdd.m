//
//  UIActionSheet+SSJAdd.m
//  UIKit
//
//  Created by 孙杰 on 2019/12/6.
//  Copyright © 2019 qhwr. All rights reserved.
//

#import "UIActionSheet+SSJAdd.h"
#import <objc/runtime.h>

static char kUIActionSheetBlockAddress;

@implementation UIActionSheet (SSJAdd)

- (void)ssj_showInView: (UIView *)view completionHandler: (ActionSheetBlock)block {
    self.delegate = self;
    objc_setAssociatedObject(self,&kUIActionSheetBlockAddress,block,OBJC_ASSOCIATION_COPY);
    
    if (view.window){
        [self showInView:view];
    } else {
        UITabBar *tabbar = [self tabbarForPresent];
        if (tabbar){
            [self showFromTabBar:tabbar];
        } else{
            [self performSelector:@selector(showInView:)
                       withObject:view
                       afterDelay:1];
        }
    }
}

- (UITabBar *)tabbarForPresent {
    UITabBar *bar = nil;
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        UIViewController *rootViewController= [[[UIApplication sharedApplication] keyWindow] rootViewController];
        if ([rootViewController isKindOfClass:[UITabBarController class]]) {
            bar = [(UITabBarController *)rootViewController tabBar];
        }
    }
    return bar;
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    ActionSheetBlock block = [objc_getAssociatedObject(self, &kUIActionSheetBlockAddress) copy];
    objc_setAssociatedObject(self,&kUIActionSheetBlockAddress,nil,OBJC_ASSOCIATION_COPY);
    dispatch_block_t dispatchBlock = ^(){
        if (block){
            block(buttonIndex);
        }
    };
    dispatchBlock();
}

- (void)ssj_clearActionBlock {
    self.delegate = nil;
    objc_setAssociatedObject(self,&kUIActionSheetBlockAddress,nil,OBJC_ASSOCIATION_COPY);
}


@end
