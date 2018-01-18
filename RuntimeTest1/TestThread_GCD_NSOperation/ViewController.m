//
//  ViewController.m
//  TestThread_GCD_NSOperation
//
//  Created by 戴运鹏 on 2017/12/22.
//  Copyright © 2017年 Elegant Team. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong)NSThread *thread;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@---%ld",[NSThread currentThread],[NSThread currentThread].stackSize);
    [NSThread detachNewThreadSelector:@selector(createThreadImplicitly:) toTarget:self withObject:@"类方法创建子线程"];
    
    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(createThreadImplicitly:) object:@"对象方法创建子线程"];

    [thread start];

//    self.thread = [[NSThread alloc]init];
//    [self performSelector:@selector(createThreadImplicitly:) onThread:self.thread withObject:@"指定线程" waitUntilDone:YES];
//    [self.thread start];
    
    [self performSelectorInBackground:@selector(createThreadImplicitly:) withObject:@"隐式创建子线程"];
    [self performSelectorOnMainThread:@selector(createThreadImplicitly:) withObject:@"在主线程进行" waitUntilDone:NO];
}

- (void)createThreadImplicitly:(NSString *)str
{//隐式创建子线程
//    NSLog(@"%s",__func__);
    NSLog(@"%@--%d",str,[NSThread currentThread].isFinished);
    
//    NSLog(@"%@ --- %ld",[NSThread currentThread],[NSThread currentThread].stackSize);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
