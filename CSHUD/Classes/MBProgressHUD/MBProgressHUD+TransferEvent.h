//
//  MBProgressHUD+TransferEvent.h
//  zhuanzhuan
//
//  Created by 赵露 on 15/12/18.
//  Copyright © 2015年 wuba. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (TransferEvent)

/**
 *  是否允许透传用户操作事件，默认为NO      add by zhaolu
 */
@property (nonatomic, assign) BOOL transferEvent;

@end
