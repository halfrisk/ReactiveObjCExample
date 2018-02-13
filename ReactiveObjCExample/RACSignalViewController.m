//
//  ViewController.m
//  ReactiveObjCExample
//
//  Created by 洪星 on 2018/2/7.
//  Copyright © 2018年 不开溜网络. All rights reserved.
//

#import "RACSignalViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface RACSignalViewController ()

@end

@implementation RACSignalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // RACSignal:有数据产生的时候,就使用RACSignal
    
    // RACSignal使用步骤: 1.创建信号  2.订阅信号 3.发送信号
    // 1.创建信号(冷信号)
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        // didSubscribe调用:只要一个信号被订阅就会调用
        // didSubscribe作用:发送数据
        NSLog(@"信号被订阅");
        //3.发送数据
        [subscriber sendNext:@1];
        
        return nil;
    }];
    
    // 2.订阅信号(热信号)
    [signal subscribeNext:^(id  _Nullable x) {
        // nextBlock调用:只要订阅者发送数据就会调用
        // nextBlock作用:处理数据,展示到UI上面
        
        // x:信号发送的内容
        NSLog(@"%@",x);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
