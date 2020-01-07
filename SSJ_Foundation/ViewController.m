//
//  ViewController.m
//  SSJ_Foundation
//
//  Created by 前海微融 on 2019/12/31.
//  Copyright © 2019年 孙杰. All rights reserved.
//

#import "ViewController.h"
#import "SSJ_Foundation/UITextView+SSJAdd.h"
#import "SSJ_Foundation/UIImage+SSJAdd.h"
#import "SSJ_Foundation/UIButton+SSJAdd.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UIButton *testButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     self.textView.placeholder = @"请输入你要输入的内容";
    self.headImg.image = [[UIImage imageNamed:@"icon_image"] ssj_roundedCornerImageWithRadius:30 corners:UIRectCornerAllCorners borderWidth:1 borderColor:[UIColor redColor]];
    
    self.testButton.sjj_timeInterval = 2.0;
    [self.testButton addTarget:self action:@selector(clickTestButton) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)clickTestButton {
    NSLog(@"点击了，点击了");
}


@end
