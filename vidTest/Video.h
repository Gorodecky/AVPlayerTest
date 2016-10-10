//
//  Video.h
//  vidTest
//
//  Created by Vitaliy on 9/7/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject

@property (strong, nonatomic) NSString* videoName;
@property (assign, nonatomic) NSInteger videoLikeCount;
@property (strong, nonatomic) NSString* videoURL;
@property (assign, nonatomic) NSInteger videoHeight;
@property (assign, nonatomic) NSInteger videoWith;
@property (strong, nonatomic) NSString* videoImageURl;

@property (strong, nonatomic) NSMutableArray* arrayVideo;

- (id)initWithServerResponse:(NSDictionary*)responseObject;
- (void) videoArrayParse:(NSArray*) arrayObject;


@end
