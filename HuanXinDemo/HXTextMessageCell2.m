//
//  HXTextMessageCell2.m
//  HuanXinDemo
//
//  Created by 印度阿三 on 16/1/27.
//  Copyright © 2016年 印度阿三. All rights reserved.
//

#import "HXTextMessageCell2.h"
#import <EMTextMessageBody.h>
#import "EMChatImage.h"
@interface HXTextMessageCell2()

@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UIButton *contentBtnV;

@end

@implementation HXTextMessageCell2

- (void)awakeFromNib {
}
+ (instancetype)cellWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier emmessage:(EMMessage *)message{
    
    return [[self alloc]initWithStyle:style reuseIdentifier:reuseIdentifier emmessage: message];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier emmessage:(EMMessage *)message
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self = [[NSBundle mainBundle] loadNibNamed:@"HXTextMessageCell2" owner:nil options:nil].firstObject;
        
        self.contentBtnV.enabled =NO;
        self.contentBtnV.titleLabel.lineBreakMode =0;
        [self.contentBtnV layoutIfNeeded];
        self.message =message;
    }
    return self;
}


- (void)iconfix{
    _icon.layer.cornerRadius  =self.frame.size.width;
    _icon.layer.masksToBounds =YES;
}

- (void)setModelDic:(NSDictionary *)modelDic{
    _modelDic =modelDic;
    if (modelDic && [modelDic isKindOfClass:[NSDictionary class]]) {
        if (modelDic[@"text"] && [modelDic[@"text"] isKindOfClass:[NSString class]]) {
           [_contentBtnV setTitle:modelDic[@"text"] forState:UIControlStateNormal];
        }
        
    }
}
/*
-(void)setMessage:(EMMessage *)message{
    _message = message;
    
    //显示数据
    //1.获取消息体
    id body = message.messageBodies[0];
    if ([body isKindOfClass:[EMTextMessageBody class]]) {//文字
        EMTextMessageBody *textBody = body;
        // 显示文字
        [_contentBtnV setTitle:textBody.text forState:UIControlStateNormal];
    }
    if ([body isKindOfClass:[EMChatImage class]]) {
        //EMChatImage *imageBody =body;
        [_contentBtnV setTitle:@"是图片" forState:UIControlStateNormal];
    }
    
}
 */
-(void)setMessage:(EMMessage *)message{
    _message = message;
    
    //显示数据
    //1.获取消息体
    id body = message.messageBodies[0];
    if ([body isKindOfClass:[EMTextMessageBody class]]) {//文字
        
        EMTextMessageBody *textBody = body;
        // 显示文字
        [_contentBtnV setTitle:textBody.text forState:UIControlStateNormal];
        /*
        if ([textBody.text  isEqual: @"wukong_01"]) {
            UIImage *image =[UIImage imageNamed:@"wukong_01"];
            [_contentBtnV setBackgroundImage:image forState:UIControlStateNormal];
        }else{
       
        }
        */
    }
    
    
    if ([body isKindOfClass:[EMChatImage class]]) {
        // EMChatImage *imageBody =body;
        [_contentBtnV setTitle:@"是图片" forState:UIControlStateNormal];
        
    }
    
}



@end
