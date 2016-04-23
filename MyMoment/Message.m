//
//  Message.m
//  MyMoment
//
//  Created by Edward Liu on 16/4/22.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import "Message.h"

@implementation Message

-(Message *)initWithSender:(NSString *)newSender WithComment:(NSString *)newComment WithTime:(NSString *)currentTime{
    self.sender=newSender;
    self.comment=newComment;
    self.time=currentTime;
    return self;
}

@end
