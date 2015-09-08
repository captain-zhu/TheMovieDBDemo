//
//  LoginViewController.m
//  TMDBManager
//
//  Created by zhu yongxuan on 15/9/7.
//  Copyright (c) 2015年 zhu yongxuan. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import "TMDBClient.h"

@interface LoginViewController ()

@end

@implementation LoginViewController{
    AppDelegate *_appDelegate;
    NSURLSession *_session;
}

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];

    /* Get the app delegate */
    _appDelegate = [UIApplication sharedApplication].delegate;

    /* Get the shared session */
    _session = [NSURLSession sharedSession];

    /* Configure the UI */
    [self configureUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)loginButtonTouch:(id)sender {


}

#pragma mark - LoginViewController

@end
