//
//  ETTapView.m
//  RuntimeTest1
//
//  Created by daiyunpeng on 2017/6/14.
//  Copyright © 2017年 Elegant Team. All rights reserved.
//

#import "ETTapView.h"
#import <objc/runtime.h>

static const char tapkey;

static const char blockey;

@implementation ETTapView

- (void)setTapActionWithBlock:(void(^)(void))block
{
    UITapGestureRecognizer *tap = objc_getAssociatedObject(self, &tapkey);
    if (!tap) {
        tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(__handleActionForTap:)];
        [self addGestureRecognizer:tap];
        objc_setAssociatedObject(self, &tapkey, tap, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &blockey, block, OBJC_ASSOCIATION_COPY);
}

- (void)__handleActionForTap:(UITapGestureRecognizer *)tap
{
    if (tap.state == UIGestureRecognizerStateRecognized) {
        void(^action)(void) = objc_getAssociatedObject(self, &blockey);
        if (action) {
            action();
        }
    }
}



@end



















































