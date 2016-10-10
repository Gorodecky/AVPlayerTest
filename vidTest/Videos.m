//
//  Videos.m
//  vidTest
//
//  Created by Vitaliy on 9/7/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

#import "Videos.h"

@implementation Videos


- (id)initWithServerResponse:(NSDictionary*)responseObject {
    
    self = [super init];
    
    if (self) {
        
        self.videoInVideos = responseObject [@"videos"];
        
        
    }
    return self;
}

@end
