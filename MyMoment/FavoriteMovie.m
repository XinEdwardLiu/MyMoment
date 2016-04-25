//
//  FavoriteMovie.m
//  MyMoment
//
//  Created by Edward Liu on 16/4/25.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import "FavoriteMovie.h"

@implementation FavoriteMovie

-(FavoriteMovie*)initWithName:(NSString *)newName WithImage:(NSImage *)newImage WithTypes:(NSString *)newType WithAuthor:(NSString *)newAuthor WithIntroduction:(NSString *)newIntroduction WithCommentMutableArray:(NSMutableArray *)newCommentMutableArray WithScore:(float)newScore WithIsFavorite:(BOOL)favorite WithUserName:(NSString *)newUserName{

    self=[super self];
    self.name=newName;
    self.image=newImage;
    self.types=newType;
    self.author=newAuthor;
    self.introduction=newIntroduction;
    self.commentMutableArray=newCommentMutableArray;
    self.score=newScore;
    self.isFavorite=favorite;
    self.userName=newUserName;
    return self;
}

@end
