//
//  Movie.m
//  MyMoment
//
//  Created by Edward Liu on 16/4/17.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import "Movie.h"

@implementation Movie



-(Movie*)initWithName:(NSString *)newName WithImage:(NSImage *)newImage WithTypes:(NSString *)newType WithAuthor:(NSString *)newAuthor WithIntroduction:(NSString *)newIntroduction WithCommentMutableArray:(NSMutableArray *)newCommentMutableArray WithScore:(NSInteger)newScore{
    self=[super self];
    self.name=newName;
    self.image=newImage;
    self.types=newType;
    self.author=newAuthor;
    self.introduction=newIntroduction;
    self.commentMutableArray=newCommentMutableArray;
    self.score=newScore;
    return self;


}

@end
