//
//  ServerMnager.m
//  vidTest
//
//  Created by Vitaliy on 9/7/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

#import "ServerManager.h"
#import "AFNetworking.h"
#import "User.h"
#import "Video.h"
#import "Videos.h"
#import "AccessToken.h"
#import "FeedViewController.h"

@interface ServerManager()



//@property (strong, nonatomic) AFHTTPRequestOperationManager* requestOperationManager;
@property (strong, nonatomic) AccessToken* accessToken;

@end

@implementation ServerManager

+ (ServerManager*) sharedManager {
    
    static ServerManager* manager = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once (&onceToken, ^{
        
        manager = [[ServerManager alloc] init];
    });
    
    return manager;
}

- (id) init {
    
    self = [super init];
    if (self) {
        
        //   NSURL* url = [NSURL URLWithString:@"https://api.vid.me/auth/create"];
        
    }
    
    return self;
}

- (void) videosGET:(NSString*) videosType
          onSucces:(void(^)(NSArray* videos)) succes
         onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure {
    
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    NSString* stringURL = [NSString stringWithFormat:@"https://api.vid.me/videos/%@", videosType];
    
    
    [manager GET:stringURL
      parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
          
          NSLog(@"Response = %@", responseObject);
          
          NSMutableArray* videos = [NSMutableArray array];
          
          for (NSDictionary* dict in responseObject[@"videos"]) {
              
              Video* videoInfo = [[Video alloc] initWithServerResponse:dict];
              
              if (videoInfo) {
                  
                  [videos addObject:videoInfo];
                  
              }
          }
          
         // NSLog(@"%@",videos);
          
          succes(videos);
          
          
      } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
          
          NSLog(@"Error: %@ %@",error, task);
      }];
}


@end
