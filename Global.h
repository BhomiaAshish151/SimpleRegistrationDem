//
//  Global.h
//  timePassOfTIR
//
//  Created by pankaj tak on 05/01/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

BOOL isLogOutPressed;

@interface Global : NSObject
{
    NSMutableDictionary *msgDict;
}

extern int globalId;

/*FOUNDATION_EXPORT NSString *const PpyImgService;
FOUNDATION_EXPORT NSString *const web_service;
FOUNDATION_EXPORT NSString *const UsrImgService;
FOUNDATION_EXPORT NSString *const RegistrationService;*/

-(void)FillMessages;
-(NSString *)GetMessage: (NSString *) msgKey;

@end
