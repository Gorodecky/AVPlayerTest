//
//  AccessToken.h
//  vidTest
//
//  Created by Vitaliy on 9/7/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccessToken : NSObject

@property (strong, nonatomic) NSString* token;
@property (strong, nonatomic) NSDate*   expirationDate;
@property (strong, nonatomic) NSString* userID;

@end
