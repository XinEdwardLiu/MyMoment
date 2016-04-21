//
//  AppDelegate.h
//  MyMoment
//
//  Created by Edward Liu on 16/3/16.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MainWindowController.h"


static BOOL staticAccountState;
static NSMutableArray *staticCommentMutableArray;
static NSMutableArray *staticMovieMutableArray;
static NSMutableArray *staticMusicMutableArray;


@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong) IBOutlet MainWindowController* mainWindowController;

+(BOOL)getStaticAccountState;
+(BOOL)setStaticAcccountState:(BOOL)newAccountState;

+(NSMutableArray *)getStaticCommentMutableArray;
+(NSMutableArray *)setStaticCommentMutableArray:(NSMutableArray *)newCommentMutableArray;

+(NSMutableArray *)getStaticMovieMutableArray;
+(NSMutableArray *)setStaticMovieMutableArray:(NSMutableArray *)newMovieMutableArray;

+(NSMutableArray *)getStaticMusicMutableArray;
+(NSMutableArray *)setStaticMusicMutableArray:(NSMutableArray *)newMusicMutableArray;

@end

