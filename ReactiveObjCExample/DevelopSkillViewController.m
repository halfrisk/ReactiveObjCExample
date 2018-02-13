//
//  DevelopSkillViewController.m
//  ReactiveObjCExample
//
//  Created by 洪星 on 2018/2/8.
//  Copyright © 2018年 不开溜网络. All rights reserved.
//

#import "DevelopSkillViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "NSObject+RACKVOWrapper.h"
#import "RedView.h"

@interface DevelopSkillViewController ()

@property (weak, nonatomic) IBOutlet RedView *redView;
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation DevelopSkillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
//    [self delegate];
//    [self KVO];
//    [self event];
//    [self notify];
    [self textFieldChanged];

}

//代理
- (void)delegate
{
    // 1.代替代理:1.RACSubject 2.rac_signalForSelector
    // 只要传值,就必须使用RACSubject
    [[_redView rac_signalForSelector:@selector(btnClick:)] subscribeNext:^(id x) {
        NSLog(@"控制器知道按钮被点击");
    }];
    
    
    [_redView.btnClickSignal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    // RAC:
    // 把控制器调用didReceiveMemoryWarning转换成信号
    // rac_signalForSelector:监听某对象有没有调用某方法
    [[self rac_signalForSelector:@selector(didReceiveMemoryWarning)] subscribeNext:^(id x) {
        NSLog(@"控制器调用didReceiveMemoryWarning");
    }];
}

    // 2.代替KVO
- (void)KVO
{

    [_redView rac_observeKeyPath:@"frame" options:NSKeyValueObservingOptionNew observer:nil block:^(id value, NSDictionary *change, BOOL causedByDealloc, BOOL affectedOnlyLastComponent) {
        //在这里处理todo
        
    }];
    
    
    [[_redView rac_valuesForKeyPath:@"frame" observer:nil] subscribeNext:^(id x) {
        // x:修改的值
        NSLog(@"修改后的值%@",x);
    }];
    
    [_redView rac_observeKeyPath:@"bounds" options:NSKeyValueObservingOptionNew observer:nil block:^(id value, NSDictionary *change, BOOL causedByDealloc, BOOL affectedOnlyLastComponent) {
        //在这里处理todo
        
    }];
    
}

    // 3.监听事件
- (void)event
{
    
    [[_btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"按钮点击了");
    }];
}


    // 4.代替通知
- (void)notify
{

    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardWillShowNotification object:nil] subscribeNext:^(id x) {
        
        NSLog(@"通知事件%@",x);
    }];
    
}


    // 5.监听文本框
-(void)textFieldChanged
{

    [_textField.rac_textSignal subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
    }];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
     _redView.frame = CGRectMake(50, 350, 200, 200);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
