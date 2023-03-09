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
    [CSHUD showLoadingInView:self.view hintText:@"123"];
//    [CSHUD showAutoHidHint:@"哈哈哈" inView:self.view];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
