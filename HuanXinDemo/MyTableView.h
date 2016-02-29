//
//  MyTableView.h
//  HuanXinDemo
//
//  Created by 印度阿三 on 16/2/18.
//  Copyright © 2016年 印度阿三. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyTableViewDelegate <NSObject>

@optional
- (void)myTableViewDidTouch:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event withPointY:(CGFloat)pointY;
- (void)myTableViewMove:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
- (void)myTableViewEnd:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event withPointY:(CGFloat)pointY;
- (void)myTableViewCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;

@end

@interface MyTableView : UITableView
@property (nonatomic,weak) id myTableViewDelegate;
@end
