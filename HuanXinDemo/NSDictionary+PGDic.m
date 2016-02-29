//
//  NSDictionary+PGDic.m
//  HuanXinDemo
//
//  Created by 印度阿三 on 16/1/27.
//  Copyright © 2016年 印度阿三. All rights reserved.
//

#import "NSDictionary+PGDic.h"

@implementation NSDictionary (PGDic)
//字典取值校验类是否相符
- (id)pg_getValueUseKey:(NSString *)key assignmentTo:(id)objc{
    
    if ([objc isKindOfClass:[NSArray class]] ) {
        if (![self objectForKey:key]|| ![[self objectForKey:key] isKindOfClass:[NSArray class]] ) {
            NSArray *array = [[NSArray alloc] init];
            return array;
        }
    }else if([objc isKindOfClass:[NSDictionary class]] ){
        if (![self objectForKey:key]|| ![[self objectForKey:key] isKindOfClass:[NSDictionary class]] ) {
            NSDictionary * dic = [NSDictionary dictionary];
            return dic;
        }
    }else if ([objc isKindOfClass:[NSString class]] ){
        if (![self objectForKey:key]|| ![[self objectForKey:key] isKindOfClass:[NSString class]] ) {
            return @"";
        }
    }else{
        return [self objectForKey:key];
    }
    
    return [self objectForKey:key];
}

//深层取值校验
- (id)pg_getValueUseKeys:(NSArray *)keyAry assignmentTo:(id)objc{
    NSDictionary *dic;
    switch (keyAry.count) {
        case 0:
            return [[objc alloc]init];
            break;
        case 1:
            return [self pg_getValueUseKey:keyAry[0] assignmentTo:objc];
            break;
        case 2:
            dic =[self pg_getValueUseKey:keyAry[0] assignmentTo:dic];
            return [dic pg_getValueUseKey:keyAry[1] assignmentTo:objc];
            break;
        default:
            for (int i = 1; i<= keyAry.count - 1; i++) {
                dic =[dic pg_getValueUseKey:keyAry[i] assignmentTo:dic];
            }
            return [self pg_getValueUseKey:[keyAry lastObject] assignmentTo:objc];
            break;
    }
    
    return [[objc alloc]init];
}

@end
