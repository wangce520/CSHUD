//
//  UIUtility.m
//  BangbangLogin
//
//  Created by 赵露 on 14-8-22.
//  Copyright (c) 2014年 wuba. All rights reserved.
//

#import "CSHUD.h"
#import "MBProgressHUD.h"
#import "IMPointLoadingView.h"
#import "MBProgressHUD+TransferEvent.h"

#define LOADING_VIEW_TEXT @"加载中"
#define HINT_DURATION 2.5

@implementation CSHUD

// ProgressHUD使用
static MBProgressHUD * _loadingHUD;
static MBProgressHUD * _hintHUD;

#pragma mark - Loading

+ (void)showLoadingInView:(UIView *)parentView hintText:(NSString *)hintText {
    [self showLoadingInView:parentView hintText:hintText backgroundColor:[UIColor colorWithWhite:0 alpha:0.7]];
}

+ (void)showLoadingInView:(UIView *)parentView hintText:(NSString *)hintText backgroundColor:(UIColor *)backgroundColor {
    
    CGRect theFrame = parentView.frame;
    if (_loadingHUD) {
        [_loadingHUD removeFromSuperview];
        _loadingHUD = nil;
    }
    _loadingHUD = [[MBProgressHUD alloc] initWithFrame:theFrame];
    _loadingHUD.labelText = hintText;
    [parentView addSubview:_loadingHUD];
    [parentView bringSubviewToFront:_loadingHUD];
    
    _loadingHUD.mode = MBProgressHUDModeCustomView;
    _loadingHUD.customView = [IMPointLoadingView viewWithPointLoading];
    [((IMPointLoadingView *)_loadingHUD.customView) startAnimating];
    
    [_loadingHUD setBackgroundColor:backgroundColor];
    [_loadingHUD setTextColor:[UIColor whiteColor]];
    [_loadingHUD setLabelFont:[UIFont systemFontOfSize:13.0f]];
    [_loadingHUD setDimBackground:NO];
    [_loadingHUD setMargin:20.0f]; // 左右内边距
    
    [_loadingHUD show:YES];
}

+ (void)hideLoading {
    if ([NSThread isMainThread]) {
        [self p_hideLoading];
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self p_hideLoading];
        });
    }
}

+ (void)p_hideLoading {
    [((IMPointLoadingView *)_loadingHUD.customView) stopAnimating];
    [_loadingHUD removeFromSuperview];
    _loadingHUD = nil;
}

+ (BOOL)isLoading {
    if (_loadingHUD) {
        return YES;
    }else{
        return NO;
    }
}

#pragma mark - Toast

/// 只展示提示信息到window
+ (void)showAutoHidHint:(NSString *)hintText{
    [CSHUD showAutoHidHint:hintText inView:nil];
}

/// 只展示提示信息到指定view
+ (void)showAutoHidHint:(NSString *)hintText inView:(UIView *)parentView{
    [CSHUD showAutoHidHint:hintText inView:parentView imageName:nil duration:HINT_DURATION completionBlock:nil];
}

/// 带有回调的提示信息
+ (void)showAutoHidHint:(NSString *)hintText inView:(UIView *)parentView completionBlock:(HUDCompletionBlock)aCompletion{
    [CSHUD showAutoHidHint:hintText inView:parentView imageName:nil duration:HINT_DURATION completionBlock:aCompletion];
}

/// 完整的方法
+ (void)showAutoHidHint:(NSString *)hintText
                 inView:(UIView *)parentView
              imageName:(NSString *)imageName
               duration:(CGFloat)duration
        completionBlock:(HUDCompletionBlock)aCompletion {
    UIWindow *theWindow = [UIApplication sharedApplication].keyWindow;
    CGRect theFrame = theWindow.frame;
    if (_hintHUD) {
        [_hintHUD removeFromSuperview];
        _hintHUD = nil;
    }
    _hintHUD = [[MBProgressHUD alloc] initWithFrame:theFrame];
    _hintHUD.layer.shadowColor = [UIColor colorWithWhite:0 alpha:0.3f].CGColor;
    _hintHUD.layer.shadowOpacity = 1.0;
    _hintHUD.layer.shadowRadius = 10.0f;
    _hintHUD.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    if (!hintText || hintText.length == 0) {
        _hintHUD.detailsLabelText = @"...";
    }
    else {
        _hintHUD.detailsLabelText = hintText;
    }
    
    if (aCompletion) {
        _hintHUD.transferEvent = NO;
    }
    else {
        _hintHUD.transferEvent = YES;
    }
    
    _hintHUD.mode = MBProgressHUDModeCustomView;
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    _hintHUD.customView = imgView;
    if(parentView) {
        [parentView addSubview:_hintHUD];
        [parentView bringSubviewToFront:_hintHUD];
    }else {
        [theWindow addSubview:_hintHUD];
    }
    [_hintHUD setColor:[UIColor colorWithWhite:0 alpha:0.7]];
    [_hintHUD setTextColor:[UIColor whiteColor]];
    [_hintHUD setDetailsLabelFont:[UIFont systemFontOfSize:13.0f]];
    [_hintHUD setDimBackground:NO];
    [_hintHUD setMargin:20.0f]; // 左右内边距
    [_hintHUD showAnimated:YES whileExecutingBlock:nil completionBlock:aCompletion];
    if (duration <= 0) { //默认3.0秒
        duration = HINT_DURATION;
    }
    [_hintHUD hide:YES afterDelay:duration];//和pm确定的时间
}

@end
