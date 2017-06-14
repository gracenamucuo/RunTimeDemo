//
//  ViewController.m
//  RuntimeTest
//
//  Created by daiyunpeng on 2017/6/14.
//  Copyright © 2017年 Elegant Team. All rights reserved.
//

#import "ViewController.h"
#import "ETTapView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ETTapView *tapview = [[ETTapView alloc]initWithFrame:CGRectMake(0, 50, 100, 100)];
    tapview.backgroundColor = [UIColor redColor];
    
    [tapview setTapActionWithBlock:^{
        NSLog(@"你好你好你好你好你好你好你好你好");
    }];
    
    
    [self.view addSubview:tapview];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
