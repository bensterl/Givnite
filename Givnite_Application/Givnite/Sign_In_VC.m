//
//  Sign_In_VC.m
//  Givnite
//
//  Created by Ben Sterling on 5/30/16.
//  Copyright (c) 2016 Ben Sterling. All rights reserved.
//

#import "Sign_In_VC.h"
#import "Home_VC.h"

@interface Sign_In_VC ()

@end

@implementation Sign_In_VC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor greenColor]];
    UITextField *username,*password;
    username = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
    password = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
    username.center = CGPointMake(self.view.center.x, 150);
    password.center = CGPointMake(self.view.center.x, 200);
    [username setText:@"Username"];
    [password setText:@"Password"];
    
    UIButton *enterButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [enterButton setTitle:@"Enter" forState:UIControlStateNormal];
    [enterButton addTarget:self action:@selector(change_screen) forControlEvents:UIControlEventTouchUpInside];
    enterButton.frame = CGRectMake(0, 0, 100, 30);
    enterButton.center = CGPointMake(self.view.center.x + 50, 230);
    
    [self.view addSubview:enterButton];
    [self.view addSubview:username];
    [self.view addSubview:password];
    
}

-(void) change_screen{
    Home_VC *v = [[Home_VC alloc] init];
    [self presentViewController:v animated:YES completion:nil];
}

@end
