//
//  Test.m
//  RuntimeTest1
//
//  Created by daiyunpeng on 2017/6/12.
//  Copyright © 2017年 Elegant Team. All rights reserved.
//

#import "Test.h"
#import <objc/objc-runtime.h>
void TestMetaClass(id self,SEL _cmd)
{
    NSLog(@"This object is %p",self);
    NSLog(@"Class is %@ super class is %@",[self class],[self superclass]);
    Class currentClass = [self class];
    for (int i = 0; i < 4; i++) {
        NSLog(@"Following the isa pointer %d times gives %p",i,currentClass);
        currentClass = objc_getClass((__bridge void*)currentClass);
    }
    NSLog(@"NSObject's class is %p",[NSObject class]);
    NSLog(@"NSObject's meta class is %p",objc_getClass((__bridge void*)[NSObject class]));
}

@implementation Test

- (void)ex_registerClassPair
{
    Class newCalss  = objc_allocateClassPair([NSError class], "TestClass", 0);
    class_addMethod(newCalss, @selector(testMetaClass), (IMP)TestMetaClass, "v@:");
    objc_registerClassPair(newCalss);
    
    id instance = [[newCalss alloc]initWithDomain:@"some domain" code:0 userInfo:nil];
    [instance performSelector:@selector(testMetaClass)];
    
}

@end











































