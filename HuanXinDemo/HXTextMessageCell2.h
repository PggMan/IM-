//
//  HXTextMessageCell2.h
//  HuanXinDemo
//
//  Created by 印度阿三 on 16/1/27.
//  Copyright © 2016年 印度阿三. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EMMessage.h>
@interface HXTextMessageCell2 : UITableViewCell

@property (nonatomic, strong) EMMessage *message;
@property (nonatomic,strong) NSDictionary *modelDic;


+ (instancetype)cellWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier emmessage:(EMMessage *)message;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier emmessage:(EMMessage *)message;
@end
