//
//  FeedViewController.h
//  vidTest
//
//  Created by Vitaliy on 9/6/16.
//  Copyright © 2016 Vitaliy. All rights reserved.
//

#import <UIKit/UIKit.h>


@class AccessToken;

typedef void(^LoginCompletionBlock) (AccessToken* token);

@interface FeedViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UIView *feedView;


-(id) initWithComletionBlock:(LoginCompletionBlock) completionBlock;

@end
