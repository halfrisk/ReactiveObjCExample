//
//  LiftViewController.m
//  ReactiveObjCExample
//
//  Created by 洪星 on 2018/2/8.
//  Copyright © 2018年 不开溜网络. All rights reserved.
//

#import "LiftViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface LiftViewController ()

@end

@implementation LiftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self liftSelector];
}

- (void)liftSelector
{
    // 当一个界面有多次请求时候,需要保证全部都请求完成,才搭建界面
    
    // 请求热销模块
    RACSignal *hotSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        // 请求数据
        // AFN
        NSLog(@"请求数据热销模块");
        
        [subscriber sendNext:@"热销模块的数据"];
        
        return nil;
    }];
    
    // 请求最新模块
    RACSignal *newSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        // 请求数据
        NSLog(@"请求最新模块");
        
        [subscriber sendNext:@"最新模块数据"];
        
        return nil;
    }];
    
    // 数组:存放信号
    // 当数组中的所有信号都发送数据的时候,才会执行Selector
    // 方法的参数:必须跟数组的信号一一对应
    // 方法的参数;就是每一个信号发送的数据
    [self rac_liftSelector:@selector(updateUIWithHotData:newData:) withSignalsFromArray:@[hotSignal,newSignal]];
}

- (void)updateUIWithHotData:(NSString *)hotData newData:(NSString *)newData
{
    // 拿到请求的数据
    NSLog(@"更新UI %@ %@",hotData,newData);
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
