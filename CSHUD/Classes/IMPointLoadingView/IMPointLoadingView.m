//
//  IMPointLoadingView.m
//  imbangbang
//
//  Created by 赵露 on 15/6/1.
//  Copyright (c) 2015年 com.58. All rights reserved.
//

#import "IMPointLoadingView.h"

#define VIEW_WIDTH              (30.0)
#define VIEW_HEIGHT             (30.0)

#define ANGLE_STEP              M_PI / 6

@interface IMPointLoadingView ()
{
    NSTimer * _animationTimer;
    CGFloat _angle;
}

@property (nonatomic, strong) UIImageView * loadingImg;

@end

@implementation IMPointLoadingView

+ (IMPointLoadingView *)viewWithPointLoading
{
    IMPointLoadingView * view = [[IMPointLoadingView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT)];
    [view setBackgroundColor:[UIColor clearColor]];
    view.loadingImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"common_point_loading"]];
    [view.loadingImg setFrame:view.bounds];
    [view addSubview:view.loadingImg];
    [view.loadingImg setHidden:YES];
    
    return view;
}

- (void)startAnimating
{
    if (_animationTimer)
    {
        [_animationTimer invalidate];
        _animationTimer = nil;
    }
    _animationTimer = [[NSTimer alloc] initWithFireDate:[NSDate date]
                                               interval:0.04
                                                 target:self
                                               selector:@selector(timerEventFunc:)
                                               userInfo:nil
                                                repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:_animationTimer forMode:NSDefaultRunLoopMode];
    
    [_loadingImg setHidden:NO];
}


- (void)stopAnimating
{
    [_loadingImg setHidden:YES];
    
    if (_animationTimer)
    {
        [_animationTimer invalidate];
        _animationTimer = nil;
    }
}


- (void)timerEventFunc:(NSTimer *)timer
{
    _angle += ANGLE_STEP;
    if (_angle >= M_PI * 2)
    {
        _angle = 0;
    }
    [_loadingImg.layer setTransform:CATransform3DMakeRotation(_angle, 0.0, 0.0, 1.0)];
}


@end
