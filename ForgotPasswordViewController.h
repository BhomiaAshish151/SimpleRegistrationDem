//
//  ForgotPasswordViewController.h
//  SignupLoginDemo
//
//  Created by Ashish Sharma on 04/09/14.
//  Copyright (c) 2014 Ashish Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"

@interface ForgotPasswordViewController : UIViewController
{
    Global *glblClass;
    
    IBOutlet UITextField *txtEmail;
    IBOutlet UIButton *Done;
   
    UIToolbar *keyboardToolbar;
    BOOL keyboardToolbarShouldHide;
}

-(IBAction)Done:(id)sender;
@property (nonatomic, retain) UIToolbar *keyboardToolbar;

@end



