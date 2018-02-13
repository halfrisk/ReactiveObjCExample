//
//  RACDisposableViewController.m
//  ReactiveObjCExample
//
//  Created by 洪星 on 2018/2/7.
//  Copyright © 2018年 不开溜网络. All rights reserved.
//

#import "RACDisposableViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface RACDisposableViewController ()

@property (nonatomic, strong) id<RACSubscriber> subscriber;

@end

@implementation RACDisposableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 1.创建信号
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        //强引用系统就不会取消订阅
        _subscriber = subscriber;
        [_subscriber sendNext:@1];
        //3.发送信号
        return [RACDisposable disposableWithBlock:^{
            // 只要信号取消订阅就会来这
            // 清空资源
            NSLog(@"信号被取消订阅了");
        }];
    }];
    
    // 2.订阅信号
    RACDisposable *disposable = [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    // 1.创建订阅者,保存nextBlock
    // 2.订阅信号
    
    // 默认一个信号发送数据完毕们就会主动取消订阅.
    // 只要订阅者在,就不会自动取消信号订阅
    // 取消订阅信号
    [disposable dispose];
    
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
