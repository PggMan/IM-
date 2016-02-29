//
//  NSDictionary+PGDic.h
//  HuanXinDemo
//
//  Created by 印度阿三 on 16/1/27.
//  Copyright © 2016年 印度阿三. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (PGDic)
//字典取值校验类是否相符
- (id)pg_getValueUseKey:(NSString *)key assignmentTo:(id)objc;
//深层取值校验
- (id)pg_getValueUseKeys:(NSArray *)keyAry assignmentTo:(id)objc;


@end
