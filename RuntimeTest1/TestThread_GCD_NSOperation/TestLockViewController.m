//
//  TestLockViewController.m
//  TestThread_GCD_NSOperation
//
//  Created by 戴运鹏 on 2017/12/22.
//  Copyright © 2017年 Elegant Team. All rights reserved.
//

#import "TestLockViewController.h"

@interface TestLockViewController ()

@end

@implementation TestLockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"1");
    
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"%@",[NSThread currentThread]);
        NSLog(@"2");
    });
/*
 dispatch_sync(dispatch_get_global_queue(0, 0), ^{
 NSLog(@"%@",[NSThread currentThread]);
 NSLog(@"2");
 });
 */
    //这里会出现死锁，dispatch_sync函数的作用是将block的任务插入到队列中，很async函数作用一样。但是sync函数会等到这个block执行完毕后，才会回到调用点继续执行。而block的执行还需要sync函数调用结束，所以造成了循环等待，导致死锁。
    NSLog(@"3");
    
    /*
     从这里看发生死锁需要2个条件：
     
     代码运行的当前队列是串行队列
     使用sync将任务加入到自己队列中
     如果queue是并行队列，或者将任务加入到其他队列中，这是不会发生死锁的。
     */
}

- (void)testMethod
{
    NSLog(@"-------测试方法-----");
}


/*
 
 2个异步APi
 void dispatch_async(dispatch_queue_t queue, dispatch_block_t block);//传入的任务是block
 void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work);//传入的任务是函数
 
 异步Api的作用是将任务提交的queue中，提交之后，立即返回，不等待任务的执行。
 */

/*
 2个同步Api
 void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block);
 void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work);
 将任务提交到queue中，任务加入queue之后不会立即返回，等待任务执行完成之后再返回
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
