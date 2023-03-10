//
//  CSViewController.m
//  CSHUD
//
//  Created by 624500136@qq.com on 03/09/2023.
//  Copyright (c) 2023 624500136@qq.com. All rights reserved.
//

#import "CSViewController.h"
#import <CSHUD/CSHUD.h>

@interface CSViewController ()

@end

@implementation CSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // 展示Loading
//    [CSHUD showLoadingInView:self.view hintText:@"哈哈" backgroundColor:UIColor.clearColor];
    // 展示提示
//    [CSHUD showAutoHideHint:@"哈哈哈" inView:self.view];
    
    /// 展示带图片的提示
//    [CSHUD showAutoHideHint:@"扫一扫"
//                         inView:self.view
//                      imageName:@"htMeScanIcon"
//                       duration:2
//            completionBlock:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
