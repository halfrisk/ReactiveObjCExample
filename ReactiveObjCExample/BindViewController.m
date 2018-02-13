//
//  BindViewController.m
//  ReactiveObjCExample
//
//  Created by 洪星 on 2018/2/9.
//  Copyright © 2018年 不开溜网络. All rights reserved.
//

#import "BindViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "RACReturnSignal.h"


@interface BindViewController ()

@end

@implementation BindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 1.创建信号
    RACSubject *subject = [RACSubject subject];
    
    // 2.绑定信号
    RACSignal *bindSignal = [subject bind:^RACSignalBindBlock _Nonnull{
            // block调用时刻:只要绑定信号被订阅就会调用
            
            
            return ^RACSignal *(id value, BOOL *stop){
                // block调用:只要源信号发送数据,就会调用block
                // block作用:处理源信号内容
                // value:源信号发送的内容
                
                NSLog(@"接收到原信号的内容:%@",value);
                
                value = [NSString stringWithFormat:@"xmg:%@",value];
                // 返回信号,不能传nil,返回空信号[RACSignal empty]
                return [RACReturnSignal return:value];
            };
    }];
    
    // 3.订阅绑定信号
    [bindSignal subscribeNext:^(id x) {
        // blcok:当处理完信号发送数据的时候,就会调用这个Block
        NSLog(@"接收到绑定信号处理完的信号%@",x);
    }];
    
    // 4.发送数据
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
