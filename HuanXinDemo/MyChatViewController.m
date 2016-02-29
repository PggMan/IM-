//
//  MyChatViewController.m
//  HuanXinDemo
//
//  Created by 印度阿三 on 16/2/18.
//  Copyright © 2016年 印度阿三. All rights reserved.
//

#import "MyChatViewController.h"
#import "HXTextMessageCell2.h"
#import "HXTextMessageCell.h"
#import "MyTableView.h"
#import <RongIMLib/RongIMLib.h>


#define Kefu_girl @"kefu_01"
@interface MyChatViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,MyTableViewDelegate,RCIMClientReceiveMessageDelegate>
{
    CGFloat allCellHeight; // 所有cell的高度
    CGFloat TouchBeginY;
    CGFloat TouchEndY;
    NSInteger talker;
    NSString *requstFlag;
    UISwipeGestureRecognizer *swipeGestR;
}

@property (strong, nonatomic) IBOutlet UIView *fatherView;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;

@property (weak, nonatomic) IBOutlet UIButton *iconButton;
@property (weak, nonatomic) IBOutlet UITextField *contentTextField;

@property (weak, nonatomic) IBOutlet MyTableView *tableView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fatherVbottom;
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation MyChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"客服";
       [self projectInitiallze];
    [self setupKeyboardObserver];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
   
}


- (void)projectInitiallze{
    // 代理对象
    self.tableView.delegate =self;
    self.tableView.dataSource=self;
    self.contentTextField.delegate =self;
    self.tableView.myTableViewDelegate =self;
    
    [[RCIMClient sharedRCIMClient] setReceiveMessageDelegate:self object:nil];
    }
- (void)setupKeyboardObserver {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(kbWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(kbWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    TouchEndY = 56;
    _dataArray =[[NSMutableArray alloc]init];
    

}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.tableView removeGestureRecognizer:swipeGestR];
}

#pragma mark -点击事件
- (IBAction)sendContentText:(id)sender {
       // 消息对象加入数组 发送信息
    [self sendContenTextWitthString:_contentTextField.text];
     _contentTextField.text =@"";

}

//发送消息
- (void)sendContenTextWitthString:(NSString *)text{
    // 构建消息的内容，这里以文本消息为例。
    RCTextMessage *testMessage = [RCTextMessage messageWithContent:text];
    
    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_PRIVATE
                                      targetId:@"KEFU145613224899510" //获取对方的 ID
                                       content:testMessage
                                   pushContent:nil
                                      pushData:nil
                                       success:^(long messageId) {
                                           [_dataArray addObject:testMessage];
                                           NSLog(@"发送成功。当前消息ID：%ld", messageId);
                                               talker =0;// 自己发消息
                                               allCellHeight =0;
                                               [self.tableView reloadData];
                                               // 清空内容
                                           
                                           [self scrollToBottom];

                                       } error:^(RCErrorCode nErrorCode, long messageId) {
                                           
                                           NSLog(@"发送失败。消息ID：%ld,错误码：%ld", messageId, (long)nErrorCode);
                                       }];
    
}
//接收消息
- (void)didReceiveMessage:(NSString *)message{
       allCellHeight =0;
       [self.tableView reloadData];
       [self scrollToBottom];
}

// 融云接收消息:文字消息
- (void)onReceived:(RCMessage *)message
              left:(int)nLeft
            object:(id)object {
    if ([message.content isMemberOfClass:[RCTextMessage class]]) {
        RCTextMessage *testMessage = (RCTextMessage *)message.content;
        NSLog(@"消息内容：%@", testMessage.content);
        
        [_dataArray addObject:message.content];
        allCellHeight =0;
        [self.tableView reloadData];
        [self scrollToBottom];

    }
    
    NSLog(@"还剩余的未接收的消息数：%d", nLeft);
}

- (void)scrollToBottom{
    if (allCellHeight >CGRectGetMaxY(self.tableView.frame)-66 ) {
        NSIndexPath *Indexpath =[NSIndexPath indexPathForRow:_dataArray.count -1 inSection:0];
        [self.tableView scrollToRowAtIndexPath:Indexpath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
}

- (IBAction)sendIconContent:(id)sender {
    

}

- (void)reloadImagesFromLibrary
{

}

//键盘将显示
-(void)kbWillShow:(NSNotification *)noti{
    //1.获取获取的高度
    //1.1.键盘结束的frm
    CGRect kbEndFrm = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGFloat kbHeight = kbEndFrm.size.height;
    NSTimeInterval duration =[noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        _fatherVbottom.constant =kbHeight;
        [self.view layoutIfNeeded];
    }];
    
}

//键盘将隐藏
-(void)kbWillHide:(NSNotification *)noti{
    NSTimeInterval duration =[noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        _fatherVbottom.constant =0;
        [self.view layoutIfNeeded];
    }];
}

#pragma mark - 抽调的方法

// 发送消息
-(void)sendMessage:(NSString *)message{
    // 1.创建一个消息对象
   }

#pragma mark -DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   
    
    static NSString *ID;
    if ([@"待定" isEqualToString:@"test_02"]) {
        requstFlag = @"0";
        ID = @"HXTextMessageCell2";
    }else{
        requstFlag = @"1";
        ID = @"HXTextMessageCell";
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        if ([requstFlag isEqualToString:@"0"]) {
            cell = [[HXTextMessageCell2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID emmessage:@"待定"];
        }else{
            cell = [[HXTextMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID emmessage:@"待定"];
            
        }
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    return cell;
}

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:
(NSIndexPath *)indexPath{
  /*
    EMMessage *message = _dataArray[indexPath.row];
    EMTextMessageBody *body =message.messageBodies.lastObject;
    if ([message.from isEqualToString:@"2222222"]) {
        return 233 +50;
    }else{
    CGFloat fontHeight =[body.text boundingRectWithSize:CGSizeMake(self.tableView.frame.size.width - 160, MAXFLOAT) options:0 attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15] }context:nil].size.height;
    allCellHeight +=(fontHeight +50);
    return fontHeight +50;
    }
   */
    return 0;
}

// textFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
}

-(void)textFieldDidEndEditing:(UITextField *)textField{

}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (scrollView.contentOffset.y  >=-45 && ![_contentTextField isFirstResponder]) {
        
        [_contentTextField becomeFirstResponder];
    }
    if (scrollView.contentOffset.y  <=-87 && [_contentTextField isFirstResponder]) {
        
        [_contentTextField endEditing:YES];
    }

}

// tableView的Touch代理
- (void)myTableViewDidTouch:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event withPointY:(CGFloat)pointY{
    
    TouchBeginY = pointY;
    if ([_contentTextField isFirstResponder]) {
        [_contentTextField endEditing:YES];
    }
}
- (void)myTableViewCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

}


@end
