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

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.userName = [coder decodeObject];
        self.userAge = [coder decodeObject];
        self.userSex=[coder decodeObject];
        self.userEmailAdress = [coder decodeObject];
        self.userPhoneNumber = [coder decodeObject];
        self.userPassword=[coder decodeObject];
         self.userIntroduction=[coder decodeObject];
    }
    return self;
}

-(void) encodeWithCoder: (NSCoder *) encoder
{
    [encoder encodeObject: self.userName];
    [encoder encodeObject: self.userAge];
    [encoder encodeObject: self.userSex];
    [encoder encodeObject: self.userEmailAdress];
    [encoder encodeObject:self.userIntroduction];
    [encoder encodeObject:self.userPassword];
    [encoder encodeObject:self.userPhoneNumber];
}

@end
