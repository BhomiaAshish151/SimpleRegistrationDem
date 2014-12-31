//
//  LoginViewController.m
//  SignupLoginDemo
//
//  Created by Ashish Sharma on 04/09/14.
//  Copyright (c) 2014 Ashish Sharma. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController


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
    self.navigationItem.hidesBackButton = YES;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    strGlobalID=[defaults objectForKey:@"GlobalID"];
    strEmailID=[defaults objectForKey:@"Email"];
    strPassword=[defaults objectForKey:@"Password"];
    txtEmail.text=strEmailID;
    txtPassword.text=strPassword;

    [btnRememberClick  setImage:[UIImage imageNamed: @"checkBoxActive.png"] forState:UIControlStateNormal];

    if([strGlobalID isEqualToString:@""])
    {
        if ([strEmailID isEqualToString:@""])
        {
           [btnRememberClick  setImage:[UIImage imageNamed: @"checkBox.png"] forState:UIControlStateNormal];
        }
    }
    else
    {
        HomeViewController *newclass=[[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
        [self.navigationController pushViewController:newclass animated:YES];
    }
    
    
    self.navigationItem.title = @"Login";
    
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
   
    txtPassword.inputAccessoryView=keyboardToolbar;
    txtEmail.inputAccessoryView=keyboardToolbar;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)previousField:(id)sender
{
    if ([txtPassword isFirstResponder])
        [txtEmail becomeFirstResponder];
    else if([txtEmail isFirstResponder])
        [txtPassword becomeFirstResponder];
}

-(void)nextField:(id)sender
{
    if ([txtEmail isFirstResponder])
        [txtPassword becomeFirstResponder];
    else if([txtPassword isFirstResponder])
        [txtEmail becomeFirstResponder];
}

-(void)resignKeyBoard:(id)sender
{
    [txtPassword resignFirstResponder];
    [txtEmail resignFirstResponder];
}

-(IBAction)btnLogin:(id)sender
{
    NSString *ProjectName = [glblClass GetMessage:@"title"];
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
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
    
    else if([txtPassword.text length]<=0)
    {
        UIAlertView*  alert =[[UIAlertView alloc]initWithTitle:ProjectName
                                                       message:@"Password cannot be left blank."
                                                      delegate:nil
                                             cancelButtonTitle:@"Ok"
                                             otherButtonTitles:nil,nil];
        [alert show];
    }
    
    else
    {
        //login webservice implementation here....
        
          if([btnRememberClick.currentImage isEqual:[UIImage imageNamed:@"checkBoxActive.png"]])
          {
              NSString *EmailStr = [txtEmail text];
              NSString *PasswordStr  = [txtPassword text];
              
              NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
              [defaults setObject:EmailStr forKey:@"Email"];
              [defaults setObject:PasswordStr forKey:@"Password"];
              [defaults setObject:@"836" forKey:@"GlobalID"];
              
              //must synchronise nsuserdefault to save or remove data properly.
              [defaults synchronize];
              
              NSLog(@"Data saved");
          }
          else{
              
              NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
              [defaults setObject:@"" forKey:@"Email"];
              [defaults setObject:@"" forKey:@"Password"];
             [defaults setObject:@"836" forKey:@"GlobalID"];
             [defaults synchronize];
          }
        
        HomeViewController *newclass=[[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
        [self.navigationController pushViewController:newclass animated:YES];
    }

}

-(IBAction)btnNewUser:(id)sender
{
    SignUpViewController *newclass=[[SignUpViewController alloc]initWithNibName:@"SignUpViewController" bundle:nil];
    [self.navigationController pushViewController:newclass animated:YES];
}

-(IBAction)btnForgotPassword:(id)sender
{
    ForgotPasswordViewController *newclass=[[ForgotPasswordViewController alloc]initWithNibName:@"ForgotPasswordViewController" bundle:nil];
    [self presentViewController:newclass animated:YES completion:nil];
}

-(IBAction)btnRememberClick:(id)sender
{
    if([btnRememberClick.currentImage isEqual:[UIImage imageNamed:@"checkBox.png"]])
    {
        [sender  setImage:[UIImage imageNamed: @"checkBoxActive.png"] forState:UIControlStateNormal];
    }
    else
    {
        [sender  setImage:[UIImage imageNamed: @"checkBox.png"] forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
