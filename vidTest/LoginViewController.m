//
//  LoginViewController.m
//  vidTest
//
//  Created by Vitaliy on 9/16/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

#import "LoginViewController.h"
#import "AFNetworking.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *userPassword;




@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButton:(id)sender {
    
    
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    NSString* userName = self.userName.text;
    NSString* userPassword = self.userPassword.text;
    
    if ([self verificationOfTheText:userName] ||
        [self verificationOfTheText:userPassword]) {
        return;
    }
    
    NSDictionary * params = @{@"username": userName,
                              @"password": userPassword};
    
    [manager POST:baseURLString parameters:params
         progress:nil
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              
              
              
              NSLog(@"Response Object = %@", responseObject);
              
              
              
              
          } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              
              NSLog(@"Error: %@, %@", error, task);
              
              self.userName.text = @"";
              
              self.userPassword.text = @"";
              
              [self alertPasswor];
              
          }];
    
}

- (BOOL) verificationOfTheText:(NSString*) text {
    
    if (text.length == 0) {
        
        [self alert];
        
        return YES;
        
    } else {
        
        return NO;
    }
}

- (void) alertPasswor {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert!!!"
                                                                   message:@"The user mame or user password error!!!"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * _Nonnull action) {}];
    
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void) alert {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert!!!"
                                                                   message:@"The user mame or user password not filled!!"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * _Nonnull action) {}];
    
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
