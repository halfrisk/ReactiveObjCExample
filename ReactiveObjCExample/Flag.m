//
//  Flag.m
//  ReactiveObjCExample
//
//  Created by 洪星 on 2018/2/8.
//  Copyright © 2018年 不开溜网络. All rights reserved.
//

#import "Flag.h"

@implementation Flag

+ (instancetype)flagWithDict:(NSDictionary *)dict
{
    Flag *flag = [[self alloc] init];
    
    [flag setValuesForKeysWithDictionary:dict];
    
    return flag;
}
@end
