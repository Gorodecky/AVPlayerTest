//
//  User.m
//  vidTest
//
//  Created by Vitaliy on 9/7/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

#import "User.h"

@implementation User

- (id) initWithServerResponse:(NSDictionary*)responseObject {
    
    self = [super init];
    
    if (self) {
        self.userName = responseObject[@"username"];
        self.userID = responseObject[@"user_id"];
    }
    
    return self;
}

@end
