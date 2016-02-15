//
//  ViewController.m
//  login UI with animation
//
//  Created by zhf on 16/2/15.
//  Copyright © 2016年 郑洪锋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // ddd
    /**
     self.userName.center.x += offset;    //userName进入
     self.password.center.x += offset;    //password进入
     self.login.alpha = 1;                //显示登录按钮
     */
    
    self.loginButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    //设置文本框初始位置为屏幕左侧
    CGPoint accountCenter = self.userNameTextField.center;
    CGPoint psdCenter = self.passwordTextField.center;
    accountCenter.x -= 100;
    psdCenter.x -= 100;
    self.userNameTextField.center = accountCenter;
    self.passwordTextField.center = psdCenter;
    
    //还原中心坐标
    accountCenter.x += 100;
    psdCenter.x += 100;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.userNameTextField.center = accountCenter;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.passwordTextField.center = psdCenter;
        } completion:^(BOOL finished) {
            self.loginButton.alpha = 1;
        }];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.userNameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
