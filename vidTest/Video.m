//
//  Video.m
//  vidTest
//
//  Created by Vitaliy on 9/7/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

#import "Video.h"

@implementation Video
- (id)initWithServerResponse:(NSDictionary*)responseObject {
    
    self = [super init];
    
    if (self) {
        
        self.videoName = responseObject [@"title"];
        self.videoLikeCount = [responseObject [@""]integerValue];
        self.videoURL = responseObject [@"clip_url"];
        self.videoHeight =  [responseObject [@"height"]integerValue];
        self.videoWith = [responseObject [@"width"]integerValue];
        self.videoImageURl = responseObject [@"thumbnail_url"];
               
    }
    
    return self;
}

- (void) videoArrayParse:(NSArray*) arrayObject {
    
    NSMutableArray* array = [NSMutableArray array];
    int i = 0;
    
    for (NSDictionary* dictionary in arrayObject) {
        
        i++;
        
        Video* video = [[Video alloc] initWithServerResponse:dictionary];
        
        [array addObject:video];
        
    NSLog(@"Video = %@", video);
    
    }
    
    self.arrayVideo = array;
    
}


@end
