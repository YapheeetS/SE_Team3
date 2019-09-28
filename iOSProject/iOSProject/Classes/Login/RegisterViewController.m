//
//  RegisterViewController.m
//  iOSProject
//
//  Created by Jame on 2019/9/28.
//  Copyright © 2019 Thomas. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
}


- (void)setupUI{
    
//    self.navigationController.navigationBar.backIndicatorImage
//    self.navigationController.navigationBar.backIndicatorImage = [UIImage imageNamed:@"nav_back"];

    self.navigationItem.title = @"Register";
    
    UIImageView *accountIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_phone"]];
    [self.view addSubview:accountIcon];
    [accountIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(70*KHeight);
        make.left.mas_equalTo(self.view).offset(40);
        make.size.mas_equalTo(CGSizeMake(15, 18));
    }];
    
    UITextField *accountText = [[UITextField alloc] init];
    accountText.font = [UIFont systemFontOfSize:14];
    accountText.placeholder = @"Input account";
    
    [self.view addSubview:accountText];
    [accountText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(accountIcon.mas_right).offset(20);
        make.right.mas_equalTo(self.view).offset(-40);
        make.height.mas_equalTo(30);
        make.centerY.mas_equalTo(accountIcon);
    }];
    
    UIView *line1 = [[UIView alloc] init];
    line1.backgroundColor = [UIColor colorWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1];
    [self.view addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(accountText.mas_bottom);
        make.left.mas_equalTo(accountText);
        make.right.mas_equalTo(accountText);
        make.height.mas_equalTo(0.5);
    }];
    
    
    
    
    UIImageView *passwordIcon1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_pwd"]];
    [self.view addSubview:passwordIcon1];
    [passwordIcon1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(accountIcon).offset(50*KHeight);
        make.left.mas_equalTo(self.view).offset(40);
        make.size.mas_equalTo(CGSizeMake(15, 18));
    }];
    
    UITextField *passwordtText1 = [[UITextField alloc] init];
    passwordtText1.secureTextEntry = YES;
    passwordtText1.font = [UIFont systemFontOfSize:14];
    passwordtText1.placeholder = @"Input password";
    [self.view addSubview:passwordtText1];
    [passwordtText1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(passwordIcon1.mas_right).offset(20);
        make.right.mas_equalTo(self.view).offset(-40);
        make.height.mas_equalTo(30);
        make.centerY.mas_equalTo(passwordIcon1);
    }];
    
    UIView *line2 = [[UIView alloc] init];
    line2.backgroundColor = [UIColor colorWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1];
    [self.view addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(passwordtText1.mas_bottom);
        make.left.mas_equalTo(passwordtText1);
        make.right.mas_equalTo(passwordtText1);
        make.height.mas_equalTo(0.5);
    }];
    
    
    
    UIImageView *passwordIcon2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_pwd"]];
    [self.view addSubview:passwordIcon2];
    [passwordIcon2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(passwordIcon1).offset(50*KHeight);
        make.left.mas_equalTo(self.view).offset(40);
        make.size.mas_equalTo(CGSizeMake(15, 18));
    }];
    
    UITextField *passwordtText2 = [[UITextField alloc] init];
    passwordtText2.secureTextEntry = YES;
    passwordtText2.font = [UIFont systemFontOfSize:14];
    passwordtText2.placeholder = @"Confirm password";
    [self.view addSubview:passwordtText2];
    [passwordtText2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(passwordIcon2.mas_right).offset(20);
        make.right.mas_equalTo(self.view).offset(-40);
        make.height.mas_equalTo(30);
        make.centerY.mas_equalTo(passwordIcon2);
    }];
    
    UIView *line3 = [[UIView alloc] init];
    line3.backgroundColor = [UIColor colorWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1];
    [self.view addSubview:line3];
    [line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(passwordtText2.mas_bottom);
        make.left.mas_equalTo(passwordtText2);
        make.right.mas_equalTo(passwordtText2);
        make.height.mas_equalTo(0.5);
    }];
    
    UIButton *registerButton = [[UIButton alloc]init];
    [registerButton setBackgroundImage:[UIImage imageNamed:@"icon_login_btn"] forState:UIControlStateNormal];
    [registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registerButton setTitle:@"Register" forState:UIControlStateNormal];
    registerButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:registerButton];
    [registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(40);
        make.right.mas_equalTo(self.view).offset(-40);
        make.top.mas_equalTo(line3.mas_bottom).offset(45);
        make.height.mas_equalTo(45);
    }];
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];

}




@end