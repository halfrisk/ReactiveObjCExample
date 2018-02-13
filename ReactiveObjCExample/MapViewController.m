//
//  MapViewController.m
//  ReactiveObjCExample
//
//  Created by 洪星 on 2018/2/9.
//  Copyright © 2018年 不开溜网络. All rights reserved.
//

#import "MapViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "RACReturnSignal.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self flattenMap];
//    [self map];
    [self signalOfsignals];
}

- (void)signalOfsignals
{
    // flattenMap:用于信号中信号
    
    RACSubject *signalOfsignals = [RACSubject subject];
    
    RACSubject *signal = [RACSubject subject];
    
    // 订阅信号
    //    [signalOfsignals subscribeNext:^(RACSignal *x) {
    //
    //        [x subscribeNext:^(id x) {
    //            NSLog(@"%@",x);
    //        }];
    //
    //    }];
    
    //    RACSignal *bindSignal = [signalOfsignals flattenMap:^RACStream *(id value) {
    //        // value:源信号发送内容
    //        return value;
    //    }];
    //
    //    [bindSignal subscribeNext:^(id x) {
    //
    //        NSLog(@"%@",x);
    //    }];
    [[signalOfsignals flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
        
        return value;
        
    }] subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
        
    }];
    
    // 发送信号
    [signalOfsignals sendNext:signal];
    [signal sendNext:@"213"];
}
- (void)map
{
    // @"123"
    // @"xmg:123"
    
    // 创建信号
    RACSubject *subject = [RACSubject subject];
    
    // 绑定信号
    RACSignal *bindSignal = [subject map:^id(id value) {
        // 返回的类型,就是你需要映射的值
        return [NSString stringWithFormat:@"xmg:%@",value];
        
    }];
    
    // 订阅绑定信号
    [bindSignal subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
    }];
    
    [subject sendNext:@"123"];
    [subject sendNext:@"321"];
}

- (void)flattenMap
{
    // 创建信号
    RACSubject *subject = [RACSubject subject];
    
    // 绑定信号
    RACSignal *bindSignal = [subject flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
        // block:只要源信号发送内容就会调用
        // value:就是源信号发送内容
        
        value = [NSString stringWithFormat:@"xmg:%@",value];
        
        // 返回信号用来包装成修改内容值
        return [RACReturnSignal return:value];
    }];
    
    // flattenMap中返回的是什么信号,订阅的就是什么信号
    
    // 订阅信号
    [bindSignal subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
    }];
    
    
    // 发送数据
    [subject sendNext:@"123"];
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
