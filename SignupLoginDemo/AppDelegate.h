//
//  AppDelegate.h
//  SignupLoginDemo
//
//  Created by Ashish Sharma on 04/09/14.
//  Copyright (c) 2014 Ashish Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    MainViewController *one;
    UINavigationController *two;
}

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,retain)   MainViewController *one;
@property(nonatomic,retain)   UINavigationController *two;

@end
