//
//  CloobieViewController.m
//  SignupLoginDemo
//
//  Created by Ashish Sharma on 05/11/14.
//  Copyright (c) 2014 Ashish Sharma. All rights reserved.
//

#import "MainViewController.h"
#import "LoginViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    self.navigationController.navigationBarHidden=YES;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)btnNewUser:(id)sender
{
    SignUpViewController *newclass=[[SignUpViewController alloc]initWithNibName:@"SignUpViewController" bundle:nil];
    [self.navigationController pushViewController:newclass animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)sigin:(id)sender
{
    LoginViewController *newclass=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    [self.navigationController pushViewController:newclass animated:YES];
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
