//
//  Home_VC.m
//  Givnite
//
//  Created by Ben Sterling on 5/30/16.
//  Copyright (c) 2016 Ben Sterling. All rights reserved.
//

#import "Home_VC.h"

#define LEFT 0
#define CENTER 1
#define RIGHT 2

@interface Home_VC ()
    //Loading Screen
    @property (retain,nonatomic) UIView *loadingScreen;
    @property (retain,nonatomic) UIView *vc,*vl,*vr;

    //To handle swiping
    @property (nonatomic) CGPoint start_location,stop_location;
    @property (nonatomic) int screen_position;
@end

@implementation Home_VC

@synthesize loadingScreen,vc,vl,vr;
@synthesize start_location,stop_location;
@synthesize screen_position;

- (void)viewDidLoad
{
    [super viewDidLoad];
    loadingScreen = [[UIView alloc] initWithFrame:self.view.frame];
    [loadingScreen setBackgroundColor:[UIColor whiteColor]];
    UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Logo.png"]];
    iv.center = self.view.center;
    [loadingScreen addSubview:iv];
    
    [self.view addSubview:loadingScreen];
    
    //Makes the splash screen two seconds
    [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(remove_loadingpage) userInfo:nil repeats:NO];
    
}

-(void) remove_loadingpage{
    //Following two lines set up swipe recognizing
    UIPanGestureRecognizer *p = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    [self.view addGestureRecognizer:p];
    
    vc = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    vc.backgroundColor = [UIColor redColor];
    [self.view addSubview:vc];
    /*UIButton *b = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    b.frame = CGRectMake(50, 50, 50, 50);
    [b setTitle:@"Dingus" forState:UIControlStateNormal];
    [vc addSubview:b];*/
    
    [loadingScreen removeFromSuperview];
}

-(void) swipe: (UIPanGestureRecognizer *) sender{
    if(sender.state == UIGestureRecognizerStateBegan) start_location = [sender locationInView:self.view];
    
    stop_location = [sender locationInView:self.view];
    float delX = stop_location.x - start_location.x;
    vc.frame = CGRectMake(delX, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    if(sender.state == UIGestureRecognizerStateEnded){
        vc.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }
}

@end
