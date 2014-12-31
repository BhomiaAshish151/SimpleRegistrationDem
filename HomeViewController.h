//
//  HomeViewController.h
//  SignupLoginDemo
//
//  Created by Ashish Sharma on 04/09/14.
//  Copyright (c) 2014 Ashish Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"

@interface HomeViewController : UIViewController
{
    IBOutlet UIButton *btnLogout;
}
-(IBAction)btnLogout:(id)sender;

@end
