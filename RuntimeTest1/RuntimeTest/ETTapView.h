//
//  ETTapView.h
//  RuntimeTest1
//
//  Created by daiyunpeng on 2017/6/14.
//  Copyright © 2017年 Elegant Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ETTapView : UIView

- (void)setTapActionWithBlock:(void(^)(void))block;

@end




