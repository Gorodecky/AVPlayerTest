//
//  FeatureViewController.m
//  vidTest
//
//  Created by Vitaliy on 9/6/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

#import "FeatureViewController.h"
#import "AFNetworking.h"
#import "ServerManager.h"

@interface FeatureViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView* indicator;

@property (strong, nonatomic) NSArray* arrayVideo;

@end

@implementation FeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self getRequest];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void) getRequest {
    
    NSString* string = @"feature";
 
    [[ServerManager sharedManager] videosGET:string onSucces:^(NSArray *videos) {
        
        if (videos == 0) {
            
            //ahtung

            NSLog(@"Alert feature");
            
        } else {
            
            self.arrayVideo = videos;
            
            NSLog(@"Self.videos = %@",self.arrayVideo);
            
        }
        
    } onFailure:^(NSError *error, NSInteger statusCode) {
        //Alert
        NSLog(@"Alert feature");
    }];
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
