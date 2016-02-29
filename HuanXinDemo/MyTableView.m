//
//  MyTableView.m
//  HuanXinDemo
//
//  Created by 印度阿三 on 16/2/18.
//  Copyright © 2016年 印度阿三. All rights reserved.
//

#import "MyTableView.h"

@implementation MyTableView

-(void)awakeFromNib{
self.contentInset =UIEdgeInsetsMake(66, 0, 0, 0);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
       [super touchesBegan:touches withEvent:event];
    CGFloat pointY =[self getYOfPointtouches:touches withEvent:event];
    if ([self.myTableViewDelegate respondsToSelector:@selector(myTableViewDidTouch:withEvent:withPointY:)]) {
        [_myTableViewDelegate myTableViewDidTouch:touches withEvent:event withPointY:pointY];
    }

}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesMoved:touches withEvent:event];
    if ([self.myTableViewDelegate respondsToSelector:@selector(myTableViewMove:withEvent:)]) {
        [_myTableViewDelegate myTableViewMove:touches withEvent:event];
    }

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
      [super touchesEnded:touches withEvent:event];
      CGFloat pointY =[self getYOfPointtouches:touches withEvent:event];
    if ([self.myTableViewDelegate respondsToSelector:@selector(myTableViewEnd:withEvent:withPointY:)]) {
        [_myTableViewDelegate myTableViewEnd:touches withEvent:event withPointY:pointY];
    }
}
- (void)touchesCancelled:(nullable NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
      [super touchesCancelled:touches withEvent:event];
    
    if ([self.myTableViewDelegate respondsToSelector:@selector(touchesCancelled:withEvent:)]) {
        [_myTableViewDelegate myTableViewCancelled:touches withEvent:event];
    }
}

- (CGFloat)getYOfPointtouches:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
    CGPoint point = [touch locationInView:[touch view]]; //返回触摸点在视图中的当前坐标
    

    
    return point.y;
}

@end
