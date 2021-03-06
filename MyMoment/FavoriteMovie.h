//
//  FavoriteMovie.h
//  MyMoment
//
//  Created by Edward Liu on 16/4/25.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
@interface FavoriteMovie : NSObject

@property  NSString *name;
@property NSImage *image;
@property  NSString *types;
@property  NSString *author;
@property  NSString *introduction;
@property  NSMutableArray *commentMutableArray;
@property  float score;
@property BOOL isFavorite;
@property NSString *userName;

-(FavoriteMovie*)initWithName:(NSString *)newName WithImage:(NSImage *)newImage WithTypes:(NSString *)newType WithAuthor:(NSString *)newAuthor WithIntroduction:(NSString *)newIntroduction WithCommentMutableArray:(NSMutableArray *)newCommentMutableArray WithScore:(float)newScore WithIsFavorite:(BOOL)favorite WithUserName:(NSString *)newUserName;

@end
