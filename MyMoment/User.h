//
//  User.h
//  MyMoment
//
//  Created by Edward Liu on 16/4/23.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import <Foundation/NSCoder.h>
@interface User : NSObject

@property NSString *userName;
@property NSString *userAge;
@property NSString *userSex;
@property NSString *userEmailAdress;
@property NSString *userPhoneNumber;
@property NSString *userPassword;
@property NSString *userIntroduction;

-(User*)initWithName:(NSString *)newName WithAge:(NSString *)newAge WithSex:(NSString*)newSex WithEmailAdress:(NSString *)newEmailAdress WithPhoneNumber:(NSString *)newPhoneNumber WithPassword:(NSString *)newPassword WithIntroduction:(NSString *)newIntroduction;

@end
