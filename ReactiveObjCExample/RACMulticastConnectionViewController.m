//
//  RACMulticastConnectionViewController.m
//  ReactiveObjCExample
//
//  Created by 洪星 on 2018/2/9.
//  Copyright © 2018年 不开溜网络. All rights reserved.
//

#import "RACMulticastConnectionViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface RACMulticastConnectionViewController ()

@end

@implementation RACMulticastConnectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    // 每次订阅不要都请求一次,指向请求一次,每次订阅只要拿到数据
    
    // 不管订阅多少次信号,就会请求一次
    // RACMulticastConnection:必须要有信号
    
    // 1.创建信号
    // 2.把信号转换成连接类
    // 3.订阅连接类的信号
    // 4.连接
    
//    [self requestBug];
    [self connect];
}

- (void)connect
{
    
    // 1.创建信号
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        // didSubscribe什么时候来:连接类连接的时候
        NSLog(@"发送热门模块的请求");
        [subscriber sendNext:@"热门模块的数据"];
        
        return nil;
    }];
    // 2.把信号转换成连接类
    // 确定源信号的订阅者RACSubject
    //    RACMulticastConnection *connection = [signal publish];
    RACMulticastConnection *connection = [signal multicast:[RACReplaySubject subject]];
    
    // 3.订阅连接类信号
    [connection.signal subscribeNext:^(id x) {
        
        // nextBlock:发送数据就会来
        NSLog(@"订阅者1:%@",x);
        
    }];
    [connection.signal subscribeNext:^(id x) {
        
        // nextBlock:发送数据就会来
        NSLog(@"订阅者2:%@",x);
        
    }];
    [connection.signal subscribeNext:^(id x) {
        
        // nextBlock:发送数据就会来
        NSLog(@"订阅者3:%@",x);
        
    }];
    
    // 4.连接
    [connection connect];
    
}


- (void)requestBug
{
    // 1.创建信号
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSLog(@"发送热门模块的请求");
        
        // 3.发送数据
        [subscriber sendNext:@1];
        
        return nil;
    }];
    
    // 2.订阅信号
    [signal subscribeNext:^(id x) {
        NSLog(@"订阅者一%@",x);
    }];
    
    [signal subscribeNext:^(id x) {
        
        NSLog(@"订阅者二%@",x);
    }];
    
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
