//
//  TableViewCell.h
//  vidTest
//
//  Created by Vitaliy on 9/6/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Video.h"
static NSString* const kTableViewCellIdentifier = @"cellIdentifier";

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageVideo;
@property (weak, nonatomic) IBOutlet UILabel *videoNameLable;


- (void)processVideo:(Video*)video;




@end

