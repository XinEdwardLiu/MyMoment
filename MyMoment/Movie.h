//
//  Movie.h
//  MyMoment
//
//  Created by Edward Liu on 16/4/17.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface Movie : NSObject
@property  NSString *name;
@property NSImage *image;
@property  NSString *types;
@property  NSString *author;
@property  NSString *introduction;
@property  NSMutableArray *commentMutableArray;
@property  float score;

-(Movie*)initWithName:(NSString *)newName WithImage:(NSImage *)newImage WithTypes:(NSString *)newType WithAuthor:(NSString *)newAuthor WithIntroduction:(NSString *)newIntroduction WithCommentMutableArray:(NSMutableArray *)newCommentMutableArray WithScore:(float)newScore;

@end
