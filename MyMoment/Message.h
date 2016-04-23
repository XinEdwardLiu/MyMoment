//
//  Message.h
//  MyMoment
//
//  Created by Edward Liu on 16/4/22.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
@interface Message : NSObject

@property NSString *sender;
@property NSString *comment;
@property NSString *time;

-(Message *)initWithSender:(NSString *)newSender WithComment:(NSString *)newComment WithTime:(NSString *)currentTime;
@end
