//
//  UIUtility.h
//  BangbangLogin
//
//  Created by 赵露 on 14-8-22.
//  Copyright (c) 2014年 wuba. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^HUDCompletionBlock)(void);

@interface CSHUD : NSObject

#pragma mark - Loading

/// 在指定View上显示等候提示框 与+ (void)hideLoading配合使用
+ (void)showLoadingInView:(UIView *)parentView hintText:(NSString *)hintText;

/// 在指定View上显示等候提示框
+ (void)showLoadingInView:(UIView *)parentView hintText:(NSString *)hintText showHintText:(BOOL)show;

/// 隐藏等候提示框 与+ (void)showLoading:(NSString *)hintText配合使用
+ (void)hideLoading;

/// 检测当前是否有loading
+ (BOOL)isLoading;

#pragma mark - Toast

/// 只展示提示信息到window
+ (void)showAutoHidHint:(NSString *)hintText;

/// 只展示提示信息到指定view
+ (void)showAutoHidHint:(NSString *)hintText inView:(UIView *)parentView;

/// 带有回调的提示信息
+ (void)showAutoHidHint:(NSString *)hintText inView:(UIView *)parentView completionBlock:(HUDCompletionBlock)aCompletion;

/// 完整的方法
+ (void)showAutoHidHint:(NSString *)hintText
                 inView:(UIView *)parentView
              imageName:(NSString *)imageName
               duration:(CGFloat)duration
        completionBlock:(HUDCompletionBlock)aCompletion;

@end
