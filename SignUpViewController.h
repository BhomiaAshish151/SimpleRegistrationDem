//
//  SignUpViewController.h
//  SignupLoginDemo
//
//  Created by Ashish Sharma on 04/09/14.
//  Copyright (c) 2014 Ashish Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Validate.h"
#import "Global.h"

@interface SignUpViewController : UIViewController<UITextFieldDelegate>
{
    Global *glblClass;
    
    IBOutlet UITextField *txtName,*txtUname,*txtPassword,*txtConfirmPassword,*txtEmail;
    IBOutlet UIButton *btnRegistration;
    
    UIToolbar *keyboardToolbar;
    BOOL keyboardToolbarShouldHide;

}
-(IBAction)btnRegistration:(id)sender;

@end
