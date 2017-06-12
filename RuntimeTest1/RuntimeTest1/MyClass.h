//
//  MyClass.h
//  RuntimeTest1
//
//  Created by daiyunpeng on 2017/6/12.
//  Copyright © 2017年 Elegant Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject<NSCopying,NSCoding>
@property (nonatomic,strong)NSArray *array;
@property (nonatomic,copy)NSString *string;

- (void)method1;
- (void)method2;
+ (void)classMethod1;
@end















