//
//  ProFilterViewController.m
//  ReactiveObjCExample
//
//  Created by 洪星 on 2018/2/11.
//  Copyright © 2018年 不开溜网络. All rights reserved.
//

#import "ProFilterViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface ProFilterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation ProFilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    [self filter];
//    [self ignore];
//    [self take];
    [self distinctUntilChanged];
    [self skip];
}

- (void)skip
{
    // skip;跳跃几个值
    // 1.创建信号
    RACSubject *subject = [RACSubject subject];
    
    [[subject skip:2] subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
    }];
    
    [subject sendNext:@"1"];
    [subject sendNext:@"2"];
    [subject sendNext:@"3"];
}

- (void)distinctUntilChanged
{
    // distinctUntilChanged:如果当前的值跟上一个值相同,就不会被订阅到
    
    // 1.创建信号
    RACSubject *subject = [RACSubject subject];
    
    [[subject distinctUntilChanged] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    [subject sendNext:@"1"];
    [subject sendNext:@"2"];
    [subject sendNext:@"2"];
}

- (void)take
{
    // 1.创建信号
    RACSubject *subject = [RACSubject subject];
    
    RACSubject *signal = [RACSubject subject];
    
    // take:取前面几个值
//    [[subject take:1] subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
    // takeLast:取后面多少个值.必须要发送完成
//    [[subject takeLast:1] subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
    // takeUntil:只要传入信号发送完成或者发送任意数据,就不能在接收源信号的内容
    [[subject takeUntil:signal] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    [subject sendNext:@"1"];
    
    //    [signal sendNext:@1];
    //    [signal sendCompleted];
    [signal sendError:nil];
    
    [subject sendNext:@"2"];
    [subject sendNext:@"3"];
    
}

- (void)ignore
{
    
    // ignore:忽略一些值
    // ignoreValues:忽略所有的值
    
    // 1.创建信号
    RACSubject *subject = [RACSubject subject];
    
    // 2.忽略一些
//    RACSignal *ignoreSignal = [subject ignoreValues];
    // 2.忽略特定值
    RACSignal *ignoreSignal = [subject ignore:@"13"];
    
    // 3.订阅信号
    [ignoreSignal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    // 4.发送数据
    [subject sendNext:@"13"];
    [subject sendNext:@"2"];
    [subject sendNext:@"44"];
    
}

- (void)filter
{
    // 只有当我们文本框的内容长度大于5,才想要获取文本框的内容
    [[_textField.rac_textSignal filter:^BOOL(id value) {
        // value:源信号的内容
        return  [value length] > 5;
        // 返回值,就是过滤条件,只有满足这个条件,才能能获取到内容
        
    }] subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
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
