//
//  MyClass.m
//  RuntimeTest1
//
//  Created by daiyunpeng on 2017/6/12.
//  Copyright © 2017年 Elegant Team. All rights reserved.
//

#import "MyClass.h"

@interface MyClass (){
    NSInteger _instance1;
    NSString *_instance2;
}
@property (nonatomic,assign)NSUInteger integer;
- (void)method3WithArg1:(NSInteger)arg1 arg2:(NSString*)agr2;
@end

@implementation MyClass

+ (void)classMethod1
{
    
}

- (void)method1
{
    NSLog(@"call method method1");
}

- (void)method2{
    
}

- (void)method3WithArg1:(NSInteger)arg1 arg2:(NSString *)agr2
{
    NSLog(@"arg1:%ld, arg2:%@",arg1,agr2);
}

@end



















