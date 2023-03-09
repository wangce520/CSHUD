//
//  MBProgressHUD+TransferEvent.m
//  zhuanzhuan
//
//  Created by 赵露 on 15/12/18.
//  Copyright © 2015年 wuba. All rights reserved.
//

#import "MBProgressHUD+TransferEvent.h"
#import <objc/runtime.h>

@implementation MBProgressHUD (TransferEvent)

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    return !self.transferEvent;
}

- (BOOL)transferEvent
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setTransferEvent:(BOOL)transferEvent
{
    objc_setAssociatedObject(self, @selector(transferEvent), @(transferEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
