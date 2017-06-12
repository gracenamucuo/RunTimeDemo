//
//  main.m
//  RuntimeTest1
//
//  Created by daiyunpeng on 2017/6/12.
//  Copyright © 2017年 Elegant Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Test.h"
#import "MyClass.h"
#import <objc/runtime.h>
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        Test *t = [[Test alloc]init];
//        [t ex_registerClassPair];
//        MyClass *myClass = [[MyClass alloc]init];
//        unsigned int outCount = 0;
//        Class cls = [myClass class];
//        NSLog(@"%@",cls);//????
//        //类名
//        NSLog(@"class name: %s",class_getName(cls));
//        NSLog(@"==========================================================");
//
//        //父类
//        NSLog(@"super class name:%s",class_getName(class_getSuperclass(cls)));
//        NSLog(@"==========================================================");
//
//        //是否是元类
//        NSLog(@"MyClass is %@ a meta-class",(class_isMetaClass(cls)) ? @"" : @"not");
//        NSLog(@"==========================================================");
//        
//        Class meta_class = objc_getMetaClass(class_getName(cls));
//        NSLog(@"%s's meta-class is %s",class_getName(cls),class_getName(meta_class));
//        NSLog(@"==========================================================");
//        
//        //变量实例大小
//        NSLog(@"instance size:%zu",class_getInstanceSize(cls));
//        NSLog(@"==========================================================");
//
//        //成员变量
//        Ivar *ivars = class_copyIvarList(cls, &outCount);
//        for (int i = 0; i < outCount; i++) {
//            Ivar ivar = ivars[0];
//            NSLog(@"instance variable's name: %s at index:%d",ivar_getName(ivar),i);
//        }
//        free(ivars);
//        
//        Ivar string = class_getInstanceVariable(cls, "_string");
//        if (string != NULL) {
//            NSLog(@"instance variable %s",ivar_getName(string));
//        }
//        NSLog(@"==========================================================");
//
//        //属性操作
//        objc_property_t *properties = class_copyPropertyList(cls, &outCount);
//        for (int i = 0; i < outCount; i++) {
//            objc_property_t property = properties[i];
//            NSLog(@"property's name: %s",property_getName(property));
//        }
//        free(properties);
//        
//        objc_property_t array = class_getProperty(cls, "array");
//        if (array != NULL) {
//            NSLog(@"property %s",property_getName(array));
//        }
//        NSLog(@"==========================================================");
//
//        //方法操作
//        Method *methods = class_copyMethodList(cls, &outCount);
//        for (int i = 0; i < outCount; i++) {
//            Method method = methods[i];
//            NSLog(@"method's signature: %s",method_getName(method));
//        }
//        free(methods);
//        Method method1 = class_getInstanceMethod(cls, @selector(method1));
//        if (method1 != NULL) {
//            NSLog(@"method %s",method_getName(method1));
//        }
//        Method classMethod = class_getClassMethod(cls, @selector(classMethod1));
//        if (classMethod != NULL) {
//            NSLog(@"class method : %s",method_getName(classMethod));
//        }
//        
//        NSLog(@"MyClass is%@ responsd to selector: method3WithArg1:arg2:", class_respondsToSelector(cls, @selector(method3WithArg1:arg2:)) ? @"" : @" not");
//        
//        IMP imp = class_getMethodImplementation(cls, @selector(method1));
//        imp();
//        NSLog(@"==========================================================");
//        
//        //协议
//        Protocol *__unsafe_unretained *protocols = class_copyProtocolList(cls, &outCount);
//        Protocol *protocol;
//        for (int i = 0; i < outCount; i++) {
//            protocol = protocols[i];
//            NSLog(@"protocol name :%s",protocol_getName(protocol));
//        }
//        NSLog(@"MyClass is%@ responsed to protocol %s", class_conformsToProtocol(cls, protocol) ? @"" : @" not", protocol_getName(protocol));

        
        //动态创建类
//        Class subCls = objc_allocateClassPair(MyClass.class, "MySubClass", 0);
//        class_addMethod(subCls, @selector(submethod1), (IMP)imp_submethod1, "v@:");

        NSLog(@"%@--%@",NSString.class,objc_getMetaClass(object_getClassName(NSString.class)));
        
        

    }
    return 0;
}



























































































