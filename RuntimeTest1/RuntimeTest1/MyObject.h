//
//  MyObject.h
//  RuntimeTest1
//
//  Created by daiyunpeng on 2017/6/14.
//  Copyright © 2017年 Elegant Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyObject : NSObject

@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *status;

- (void)setDataWithDic:(NSDictionary *)dic;

@end
