//
//  SignUpViewController.m
//  SignupLoginDemo
//
//  Created by Ashish Sharma on 04/09/14.
//  Copyright (c) 2014 Ashish Sharma. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

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
    self.navigationItem.title = @"Registration";
    
    self.navigationController.navigationBarHidden=NO;
    
    glblClass=[[Global alloc]init];
    
    if (keyboardToolbar==nil) {
        keyboardToolbar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
        [keyboardToolbar setBackgroundColor:[UIColor blackColor]];
        [[UIBarButtonItem appearance] setTintColor: [UIColor colorWithRed:(151.0/255.0) green:(145.0/255.0) blue:(122.0/255.0) alpha:1]];
        UIBarButtonItem *previousButton=[[UIBarButtonItem alloc]initWithTitle:@"Previous" style:UIBarButtonItemStyleBordered target:self action:@selector(previousField:)];
        UIBarButtonItem *nextButton=[[UIBarButtonItem alloc]initWithTitle:@"Next" style:UIBarButtonItemStyleBordered target:self action:@selector(nextField:)];
        UIBarButtonItem *extraSpaces=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *DoneButton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(resignKeyBoard:)];
        [keyboardToolbar setItems:[[NSArray alloc]initWithObjects:previousButton,nextButton,extraSpaces,DoneButton,nil]];
    }
    
    txtName.inputAccessoryView=keyboardToolbar;
    txtUname.inputAccessoryView=keyboardToolbar;
    txtPassword.inputAccessoryView=keyboardToolbar;
    txtConfirmPassword.inputAccessoryView=keyboardToolbar;
    txtEmail.inputAccessoryView=keyboardToolbar;
    

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)previousField:(id)sender
{
    if ([txtName isFirstResponder])
        [txtEmail becomeFirstResponder];
    else if([txtUname isFirstResponder])
        [txtName becomeFirstResponder];
    else if([txtPassword isFirstResponder])
        [txtUname becomeFirstResponder];
    
    else if([txtConfirmPassword isFirstResponder])
        [txtPassword becomeFirstResponder];
    else if([txtEmail isFirstResponder])
        [txtConfirmPassword becomeFirstResponder];
}

-(void)nextField:(id)sender
{
    if ([txtName isFirstResponder])
        [txtUname becomeFirstResponder];
    else if([txtUname isFirstResponder])
        [txtPassword becomeFirstResponder];
    else if([txtPassword isFirstResponder])
        [txtConfirmPassword becomeFirstResponder];
    else if([txtConfirmPassword isFirstResponder])
        [txtEmail becomeFirstResponder];
    else if([txtEmail isFirstResponder])
        [txtName becomeFirstResponder];
}

-(void)resignKeyBoard:(id)sender
{
    [txtName resignFirstResponder];
    [txtUname resignFirstResponder];
    [txtPassword resignFirstResponder];
    [txtConfirmPassword resignFirstResponder];
    [txtEmail resignFirstResponder];
}

-(IBAction)btnRegistration:(id)sender
{
    NSString *ProjectName = [glblClass GetMessage:@"title"];
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
   
    NSString *trimmedname = [txtName.text stringByTrimmingCharactersInSet:
                             [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *trimmedUname = [txtUname.text stringByTrimmingCharactersInSet:
                      [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([trimmedname isEqualToString:@""])
    {
        UIAlertView*  alert =[[UIAlertView alloc]initWithTitle:ProjectName
                                                       message:@"Name cannot be left blank."
                                                      delegate:nil
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil,nil];
        [alert show];
    }
    
    else if([trimmedUname isEqualToString:@""])
    {
        UIAlertView*  alert =[[UIAlertView alloc]initWithTitle:ProjectName
                                                       message:@"User name cannot be left blank."
                                                      delegate:nil
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil,nil];
        [alert show];
    }
    
    else if (![Validate isValidUserName:trimmedUname])
    {
        UIAlertView*  alert =[[UIAlertView alloc]initWithTitle:ProjectName
                                                       message:@"User name cannot contain space."
                                                      delegate:nil
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil,nil];
        [alert show];
    }
    
    else if([txtPassword.text length]<=0)
    {
        UIAlertView*  alert =[[UIAlertView alloc]initWithTitle:ProjectName
                                                       message:@"Password cannot be left blank."
                                                      delegate:nil
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil,nil];
        [alert show];
    }
    
    else if([txtConfirmPassword.text length]<=0)
    {
        UIAlertView*  alert =[[UIAlertView alloc]initWithTitle:ProjectName
                                                       message:@"Confirm password cannot be left blank."
                                                      delegate:nil
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil,nil];
        [alert show];
    }
    
    else if(![txtConfirmPassword.text isEqualToString:txtPassword.text])
    {
        UIAlertView*  alert =[[UIAlertView alloc]initWithTitle:ProjectName
                                                       message:@"Confirm password did not match."
                                                      delegate:nil
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil,nil];
        [alert show];
    }
    
    else if([txtEmail.text length]<=0)
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
        UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:ProjectName
                                                      message:@"Success."
                                                     delegate:self
                                            cancelButtonTitle:@"Ok"
                                            otherButtonTitles:nil];
        [alert1 show];
        //webservice implementation there....
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
