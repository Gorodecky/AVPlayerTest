//
//  TableViewCell.m
//  vidTest
//
//  Created by Vitaliy on 9/6/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

#import "TableViewCell.h"
#import "UIImageView+AFNetworking.h"

@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)processVideo:(Video*)video {
    
    self.videoNameLable.text = video.videoName;
    
    NSLog(@"Image request %@", video.videoImageURl);
    
    NSURL* url = [NSURL URLWithString:video.videoImageURl];
    
    NSURLRequest* requect = [NSURLRequest requestWithURL:url];
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^(void){
        
        [self.imageVideo setImageWithURLRequest: requect
                                placeholderImage:nil
                                         success:^(NSURLRequest* request,
                                                   NSHTTPURLResponse* response,
                                                   UIImage*theImage) {
                                             
                                             dispatch_async(dispatch_get_main_queue(), ^(void) {
                                                 
                                                 self.imageVideo.image = theImage;
                                                 //self.activityIndicator.hidden = YES;
                                                 //[self.activityIndicator stopAnimating];
                                                 
                                             });
                                             
                                         } failure:^(NSURLRequest* request,
                                                     NSHTTPURLResponse* response,
                                                     NSError * error) {
                                             
                                             dispatch_async(dispatch_get_main_queue(), ^(void) {
                                                 
                                                 //[self.activityIndicator startAnimating];
                                                 
                                                 NSLog(@"Error photo upload in Request - %@", request);
                                                 
                                             });
                                         }];
    });
    
    [self updateConstraints];
    
}



@end
