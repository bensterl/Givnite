//
//  ViewController.m
//  Givnite
//
//  Created by Ben Sterling on 5/29/16.
//  Copyright (c) 2016 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "Sign_In_VC.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Main Screen Setup
    UIImageView *main_screen = [[UIImageView alloc]initWithFrame:self.view.frame];
    [main_screen setImage:[UIImage imageNamed:@"Rectangle_51.png"]];
    UIImageView *l = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Group.png"]];
    l.center = self.view.center;
    [main_screen addSubview:l];
    [self.view addSubview:main_screen];
     
    UIView *loadingScreen = [[UIView alloc] initWithFrame:self.view.frame];
    [loadingScreen setBackgroundColor:[UIColor whiteColor]];
    UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Logo.png"]];
    iv.center = self.view.center;
    [loadingScreen addSubview:iv];
    
    //Creating 3 sign-in buttons
    UIButton *sign_up_google,*sign_up_fb,*sign_in;
    sign_in = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    sign_up_google = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    sign_up_fb = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    //Assigning them titles
    [sign_in setTitle:@"Sign In" forState:UIControlStateNormal];
    [sign_up_google setBackgroundImage:[UIImage imageNamed:@"Group_2.png"] forState:UIControlStateNormal];
    [sign_up_fb setBackgroundImage:[UIImage imageNamed:@"Group_3.png"] forState:UIControlStateNormal];
    
    //Assigning them selectors
    [sign_in addTarget:self action:@selector(button_clicked:) forControlEvents:UIControlEventTouchUpInside];
    [sign_up_google addTarget:self action:@selector(button_clicked:) forControlEvents:UIControlEventTouchUpInside];
    [sign_up_fb addTarget:self action:@selector(button_clicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //Assigning the rects
    sign_in.frame = CGRectMake(0, 0, 200, 30);
    sign_in.center = CGPointMake(self.view.center.x, 360);
    sign_up_google.frame = CGRectMake(0, 0, 200, 30);
    sign_up_google.center = CGPointMake(self.view.center.x, 400);
    sign_up_fb.frame = CGRectMake(0, 0, 200, 30);
    sign_up_fb.center = CGPointMake(self.view.center.x, 440);
    
    //Adding them as subviews
    [self.view addSubview:sign_in];
    [self.view addSubview:sign_up_google];
    [self.view addSubview:sign_up_fb];
    [self.view addSubview:loadingScreen];
    
    //Makes the splash screen two seconds
    [NSTimer scheduledTimerWithTimeInterval:2.0f target:loadingScreen selector:@selector(removeFromSuperview) userInfo:nil repeats:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

-(void) button_clicked:(UIButton *) button{
    if([[NSString stringWithFormat:@"Sign In"] isEqualToString:button.titleLabel.text]){
        
        Sign_In_VC *v = [[Sign_In_VC alloc] init];
        [self presentViewController:v animated:YES completion:nil];
        
    }else if([[NSString stringWithFormat:@"Sign Up with Google"] isEqualToString:button.titleLabel.text]){
        
    }else if([[NSString stringWithFormat:@"Sign Up with Facebook"] isEqualToString:button.titleLabel.text]){
        
    }
}

@end
