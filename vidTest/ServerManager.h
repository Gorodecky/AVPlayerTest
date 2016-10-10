//
//  ServerMnager.h
//  vidTest
//
//  Created by Vitaliy on 9/7/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

#import <Foundation/Foundation.h>


@class User, Video, Videos;


@interface ServerManager : NSObject

@property (strong, nonatomic) User* currentUser;

+ (ServerManager*) sharedManager;

//- (void) autorizeUser:(void(^)(User* user)) completion;

- (void) videosGET:(NSString*) videosType
          onSucces:(void(^)(NSArray* videos)) succes
         onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure;

@end
