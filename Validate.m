//
//  Validate.m
//  GiftMail
//
//  Created by Shivam on 11/19/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Validate.h"


@implementation Validate

/**
 * Function name isNull                         
 *                                              
 * @params: NSString *str                       
 *                                              
 * @object: function to check a string to null  
 *
 * return BOOL
 */

+ (BOOL)isNull:(NSString*)str{
	if ([[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""] || str==nil) {
		return YES;
	}
	return NO;
}
/**
 * Function name isValidEmailId                
 *                                              
 * @params: NSString                            
 *                                              
 * @object: function to check a valid email id  
 *
 * return BOOL
 */


+ (BOOL)isValidEmailId:(NSString*)email
{
    
	NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"; 
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex]; 
    
	return [emailTest evaluateWithObject:email];
}

+ (BOOL)isValidMobileNumber:(NSString*)number
{
    number=[number stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	if ([number length]<5 || [number length]>17) {
		return FALSE;
	}
	NSString *Regex = @"^([0-9]*)$"; 
    NSPredicate *mobileTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex]; 
	
    return [mobileTest evaluateWithObject:number];
}

+ (BOOL) isValidUserName:(NSString*)userName{
    NSString *regex=@"^[a-zA-Z0-9_-]{3,50}$";
    NSPredicate *userNameTest=[NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [userNameTest evaluateWithObject:userName];
}

+ (BOOL) isValidPassword:(NSString*)password{
    NSString *regex=@"^[a-zA-Z0-9_-[!#$%&]]{5,30}$";
    NSPredicate *passwordTest=[NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [passwordTest evaluateWithObject:password];
}

@end
