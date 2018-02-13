//
//  RACSequenceViewController.m
//  ReactiveObjCExample
//
//  Created by 洪星 on 2018/2/8.
//  Copyright © 2018年 不开溜网络. All rights reserved.
//

#import "RACSequenceViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "Flag.h"

@interface RACSequenceViewController ()

@end

@implementation RACSequenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
//    [self tuple];
//    [self arr];
//    [self dict];
    [self plist];
}

- (void)plist {
    
    // 解析plist文件
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil];
    NSArray *dictArr = [NSArray arrayWithContentsOfFile:filePath];
    
    //    NSMutableArray *arr = [NSMutableArray array];
    //    [dictArr.rac_sequence.signal subscribeNext:^(NSDictionary *x) {
    //        Flag *flag = [Flag flagWithDict:x];
    //        [arr addObject:flag];
    //    }];
    
    // 高级用法
    // 会把集合中所有元素都映射成一个新的对象
    NSArray *arr = [[dictArr.rac_sequence map:^id(NSDictionary *value) {
        // value:集合中元素
        // id:返回对象就是映射的值
        return [Flag flagWithDict:value];
    }] array];
    
    NSLog(@"%@",arr);
    
}

- (void)dict
{
    
    // 字典
    NSDictionary *dict = @{@"account":@"aaa",@"name":@"xmg",@"age":@18};
    
    // 转换成集合
    [dict.rac_sequence.signal subscribeNext:^(RACTuple *x) {
        //       NSString *key = x[0];
        //        NSString *value = x[1];
        //        NSLog(@"%@ %@",key,value);
        
        // RACTupleUnpack:用来解析元组
        // 宏里面的参数,传需要解析出来的变量名
        // = 右边,放需要解析的元组
        RACTupleUnpack(NSString *key,NSString *value) = x;
        
        NSLog(@"%@ %@",key,value);
    }];
}

- (void)arr
{
    // 数组
    NSArray *arr = @[@"213",@"321",@1];
    
    // RAC集合
    //    RACSequence *sequence = arr.rac_sequence;
    //
    //    // 把集合转换成信号
    //    RACSignal *signal = sequence.signal;
    //
    //    // 订阅集合信号,内部会自动遍历所有的元素发出来
    //    [signal subscribeNext:^(id x) {
    //        NSLog(@"%@",x);
    //    }];
    
    [arr.rac_sequence.signal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
}

- (void)tuple
{
    // 元组
    RACTuple *tuple = [RACTuple tupleWithObjectsFromArray:@[@"213",@"321",@1]];
    NSString *str = tuple[0];
    
    NSLog(@"%@",str);
    NSLog(@"%@",tuple);
    
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
