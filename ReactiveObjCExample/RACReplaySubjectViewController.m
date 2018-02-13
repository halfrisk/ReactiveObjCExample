//
//  RACReplaySubjectViewController.m
//  ReactiveObjCExample
//
//  Created by 洪星 on 2018/2/8.
//  Copyright © 2018年 不开溜网络. All rights reserved.
//

#import "RACReplaySubjectViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface RACReplaySubjectViewController ()

@end

@implementation RACReplaySubjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self RACReplaySubject];
    
}

- (void)RACReplaySubject
{
    // 1.创建信号
    RACReplaySubject *subject = [RACReplaySubject subject];
    
    // 2.订阅信号
    [subject subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    // 遍历所有的值,拿到当前订阅者去发送数据
    
    // 3.发送信号
    [subject sendNext:@1];
    //    [subject sendNext:@1];
    // RACReplaySubject发送数据:
    // 1.保存值
    // 2.遍历所有的订阅者,发送数据
    
    
    // RACReplaySubject:可以先发送信号,再订阅信号
}

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
