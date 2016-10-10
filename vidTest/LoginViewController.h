//
//  LoginViewController.h
//  vidTest
//
//  Created by Vitaliy on 9/16/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

- (IBAction)loginButton:(id)sender;

@end
static NSString* const baseURLString = @"https://api.vid.me/auth/create";
