//
//  NavigationController.m
//  HuanXinDemo
//
//  Created by 印度阿三 on 16/1/30.
//  Copyright © 2016年 印度阿三. All rights reserved.
//

#import "NavigationController.h"
#import "ViewController.h"
@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    ViewController *vc =[[ViewController alloc] init];
   
    [self.view addSubview:vc.view];
    self.view.backgroundColor = [UIColor whiteColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
