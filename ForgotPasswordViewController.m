//
//  ForgotPasswordViewController.m
//  SignupLoginDemo
//
//  Created by Ashish Sharma on 04/09/14.
//  Copyright (c) 2014 Ashish Sharma. All rights reserved.
//

#import "ForgotPasswordViewController.h"

@interface ForgotPasswordViewController ()

@end

@implementation ForgotPasswordViewController
@synthesize keyboardToolbar;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    glblClass=[[Global alloc]init];
    
    if (keyboardToolbar==nil) {
        keyboardToolbar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
        [keyboardToolbar setBackgroundColor:[UIColor blackColor]];
        [[UIBarButtonItem appearance] setTintColor: [UIColor colorWithRed:(151.0/255.0) green:(145.0/255.0) blue:(122.0/255.0) alpha:1]];
        
        UIBarButtonItem *extraSpaces=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *DoneButton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(resignKeyBoard:)];
        [keyboardToolbar setItems:[[NSArray alloc]initWithObjects:extraSpaces,DoneButton,nil]];
    }
    
    txtEmail.inputAccessoryView=keyboardToolbar;
    self.navigationItem.title = @"Forgot Password";
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(IBAction)Cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(IBAction)Done:(id)sender
{
    NSString *ProjectName = [glblClass GetMessage:@"title"];

    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    if([txtEmail.text length]<=0)
    {
        UIAlertView*  alert =[[UIAlertView alloc]initWithTitle:ProjectName
                                                       message:@"Email ID cannot be left blank."
                                                      delegate:nil
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil,nil];
        [alert show];
    }
    
    else if ([emailTest evaluateWithObject:txtEmail.text]==NO)
    {
        UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:ProjectName
                                                      message:@"Please enter valid email ID."
                                                     delegate:self
                                            cancelButtonTitle:@"Ok"
                                            otherButtonTitles:nil];
        [alert1 show];
    }
    else
    {
            //Forgot Password service implementation....
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [txtEmail resignFirstResponder];
    return YES;
}

-(void)resignKeyBoard:(id)sender
{
    [txtEmail resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
