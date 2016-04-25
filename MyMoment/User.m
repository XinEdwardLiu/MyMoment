//
//  User.m
//  MyMoment
//
//  Created by Edward Liu on 16/4/23.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import "User.h"

@implementation User

-(User*)initWithName:(NSString *)newName WithAge:(NSString *)newAge WithSex:(NSString*)newSex WithEmailAdress:(NSString *)newEmailAdress WithPhoneNumber:(NSString *)newPhoneNumber WithPassword:(NSString *)newPassword WithIntroduction:(NSString *)newIntroduction{
    self.userName=newName;
    self.userAge=newAge;
    self.userSex=newSex;
    self.userEmailAdress=newEmailAdress;
    self.userPhoneNumber=newPhoneNumber;
    self.userPassword=newPassword;
    self.userIntroduction=newIntroduction;
    
    return self;


}

@end
