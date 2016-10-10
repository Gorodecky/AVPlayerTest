//
//  Videos.h
//  vidTest
//
//  Created by Vitaliy on 9/7/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Videos : NSObject

@property (strong, nonatomic) NSString* videosName;
@property (strong, nonatomic) NSString* videosID;
@property (assign, nonatomic) NSInteger videosCount;

@property (strong, nonatomic) NSArray* videoInVideos;


- (id)initWithServerResponse:(NSDictionary*)responseObject;

@end
