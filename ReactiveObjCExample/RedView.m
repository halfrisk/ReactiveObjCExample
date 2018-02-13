//
//  RedView.m
//  ReactiveObjCExample
//
//  Created by 洪星 on 2018/2/8.
//  Copyright © 2018年 不开溜网络. All rights reserved.
//

#import "RedView.h"

@implementation RedView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (RACSubject *)btnClickSignal
{
    if (_btnClickSignal == nil) {
        _btnClickSignal = [RACSubject subject];
    }
    return _btnClickSignal;
}

- (IBAction)btnClick:(id)sender
{
    //    NSLog(@"按钮被点击了");
    // 通知控制器做事情
    [self.btnClickSignal sendNext:@1];
}

@end
