//
//  LoginViewController.h
//  SignupLoginDemo
//
//  Created by Ashish Sharma on 04/09/14.
//  Copyright (c) 2014 Ashish Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Validate.h"
#import "Global.h"
#import "HomeViewController.h"
#import "SignUpViewController.h"
#import "ForgotPasswordViewController.h"

@interface LoginViewController : UIViewController<UITextFieldDelegate>
{
    Global *glblClass;
    
    NSString* strEmailID,*strGlobalID,*strPassword;
    IBOutlet UITextField *txtEmail,*txtPassword;
    IBOutlet UIButton *btnLogin,*btnRememberClick,*btnForgotPassword,*btnNewUser;
    
    UIToolbar *keyboardToolbar;
    BOOL keyboardToolbarShouldHide;
    
}
-(IBAction)btnLogin:(id)sender;
-(IBAction)btnRememberClick:(id)sender;
-(IBAction)btnForgotPassword:(id)sender;
-(IBAction)btnNewUser:(id)sender;

@end


