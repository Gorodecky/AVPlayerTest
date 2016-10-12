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
#import "TableViewCell.h"

@interface FeatureViewController () <UITableViewDelegate, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray* arrayVideo;

@end

@implementation FeatureViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UINib* nibCell= [UINib nibWithNibName:@"TableViewCell" bundle:nil];
    
    
    
    [[self tableView] registerNib:nibCell
           forCellReuseIdentifier:kTableViewCellIdentifier];
    
    
    NSString* string = @"feature";
    
    [[ServerManager sharedManager] videosGET:string onSucces:^(NSArray *videos) {
        
        if (videos == 0) {
            
            NSLog(@"Alert feature");
            
        } else {
            
            self.arrayVideo = videos;
            
            NSLog(@"Self.videos = %@",self.arrayVideo);
            
            [self.tableView reloadData];
        }
        
    } onFailure:^(NSError *error, NSInteger statusCode) {
        //Alert
        NSLog(@"Alert feature");
    }];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayVideo.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell* cell = (TableViewCell*)[tableView dequeueReusableCellWithIdentifier:kTableViewCellIdentifier];
    
    if (!cell) {
        NSArray*nib = [[NSBundle mainBundle] loadNibNamed:@"TableViewCell"
                                                    owner:self
                                                  options:nil];
        
        cell = [nib objectAtIndex:0];
    }
    
    Video* video = [self.arrayVideo objectAtIndex:indexPath.row];
    [cell processVideo:video];
    
    return cell;
    
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
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
