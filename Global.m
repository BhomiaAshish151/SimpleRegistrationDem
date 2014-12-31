//
//  Global.m
//  timePassOfTIR
//
//  Created by pankaj tak on 05/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Global.h"

@implementation Global
{
    //
}

-(id)init
{
    self = [super init];
    if ( self ) {
        [self FillMessages];
        //Initialization code here
    }
    return self;
}

-(void)FillMessages
{
    msgDict = [[NSMutableDictionary alloc] init];
    
    [msgDict setObject:@"ProjectName" forKey:@"title"];
    
    [msgDict setObject:@"No internet connection found. Please try again later.." forKey:@"internet_connection"];
    //==LOGIN PAGE====
    [msgDict setObject:@"Either User ID or Password is missing." forKey:@"login_message"];
    [msgDict setObject:@"Either user ID is invalid or Password is wrong." forKey:@"wrongUsrpassword"];
    //[msgDict setObject:@"Login Sucessfully" forKey:@"Sucess"];
    //REGISTRATION PAGE

    [msgDict setObject:@"Name can not be left blank." forKey:@"name_message"];
    [msgDict setObject:@"User name can not be left blank." forKey:@"name_message"];
    [msgDict setObject:@"Password can not be left blank." forKey:@"password_message"];
    [msgDict setObject:@"Confirm password can not be left blank." forKey:@"conpassword_message"];
    [msgDict setObject:@"Email ID can not be left blank." forKey:@"email_message"];
    [msgDict setObject:@"Password does not match." forKey:@"matchpassword_message"];
    [msgDict setObject:@"Congratulations! You have registered successfully." forKey:@"registrationcorrect"];
    [msgDict setObject:@"Email ID already exists." forKey:@"registrationwrong"];
    [msgDict setObject:@"Error in processing request. Please try again later." forKey:@"registrationfaild"];
    //FORGOT PASSWORD PAGE===
    //[msgDict setObject:@"Forgetpassword can not be blank" forKey:@"forgetpassword_message"];
    [msgDict setObject:@"Sorry there is no user registered with given email ID." forKey:@"FORGOTWRONGMESSAGE"];
    [msgDict setObject:@"Kindly check your email, we have sent password there." forKey:@"FORGOTCORRECTMESSAGE"];
    [msgDict setObject:@"Are you sure that you want to flag this user?" forKey:@"flagMessage"];
    [msgDict setObject:@"Old password does not exists." forKey:@"OldPasswordWrong"];
}

-(NSString *)GetMessage: (NSString *) msgKey{
    NSString * msg =  @"";
    msg = [msgDict objectForKey:msgKey];
    NSLog(@"%@",msgKey);
    NSLog(@"%@",msg);
    return msg;
}

int globalId;

@end
