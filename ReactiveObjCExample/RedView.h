//
//  RedView.h
//  ReactiveObjCExample
//
//  Created by 洪星 on 2018/2/8.
//  Copyright © 2018年 不开溜网络. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveObjC/ReactiveObjC.h>

@interface RedView : UIView

@property (nonatomic, strong) RACSubject *btnClickSignal;

@end
