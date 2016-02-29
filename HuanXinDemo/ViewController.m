//
//  ViewController.m
//  HuanXinDemo
//
//  Created by 印度阿三 on 16/1/27.
//  Copyright © 2016年 印度阿三. All rights reserved.
//

#import "ViewController.h"
#import <RongIMLib/RongIMLib.h>
#import "MyChatViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}





- (IBAction)login {
    
    [[RCIMClient sharedRCIMClient] connectWithToken:@"yoZmyItAIHM2smfqvHkcjG9o0TyvoUxfmKXJXc1CUmy0bV4udxP/HvIwq3D2Oyy/yav7UvQrDqJbU8q0rdPs2w=="
                                            success:^(NSString *userId) {
                                                NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
                                                MyChatViewController *vc =[[MyChatViewController alloc] init];
                                                UINavigationController *nev = [[UINavigationController alloc] initWithRootViewController:vc];
                                                
                                                [self presentViewController:nev animated:YES completion:nil];
                                            } error:^(RCConnectErrorCode status) {
                                                NSLog(@"登陆的错误码为:%ld", (long)status);
                                            } tokenIncorrect:^{
                                                //token过期或者不正确。
                                                //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
                                                //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
                                                NSLog(@"token错误");
                                            }];
}
@end
