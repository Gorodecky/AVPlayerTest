//
//  User.h
//  vidTest
//
//  Created by Vitaliy on 9/7/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString* userName;
@property (strong, nonatomic) NSString* userID;

- (id) initWithServerResponse:(NSDictionary*)responseObject;

@end
