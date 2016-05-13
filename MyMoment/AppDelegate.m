//
//  AppDelegate.m
//  MyMoment
//
//  Created by Edward Liu on 16/3/16.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import "AppDelegate.h"



@interface AppDelegate ()
//@property (strong) IBOutlet MainWindowController* mainWindowController;
@property (weak) IBOutlet NSWindow *window;
- (IBAction)saveAction:(id)sender;


@end

@implementation AppDelegate

-(void)readingUserCoreData{
    NSError *error=nil;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"UserCoreData"];
    id results = [self.managedObjectContext executeFetchRequest:request error:&error];
 
    //if (!results) {
    //    NSLog(@"Error fetching Employee objects: %@\n%@", [error localizedDescription], [error userInfo]);
    //    abort();
    //}
    if([results count]!=0){
        UserCoreData *tempUserCoreDate=[results objectAtIndex:0];
        NSMutableArray *tempArray=[NSKeyedUnarchiver unarchiveObjectWithData:tempUserCoreDate.userArrayData];
        [AppDelegate setstaticUserMutableArray:tempArray];
        NSLog(@"%@",[AppDelegate getStaticUserMutableArray]);
        NSLog(@"%@",[[tempArray objectAtIndex:[tempArray count]-1] valueForKey:@"userName"]);
    }
}
-(void)initMusicValue{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    NSString *currentTime=[dateFormatter stringFromDate:[NSDate date]];
    Message *firstMessage=[[Message alloc]initWithSender:@"楼主" WithComment:@"沙发，欢迎评论！" WithTime:currentTime];
    NSMutableArray *commentMutableArray1=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray2=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray3=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray4=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray5=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray6=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray7=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray8=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray9=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray10=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray11=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray12=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray13=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray14=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray15=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray16=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray17=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray18=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray19=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray20=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    
    Music *music1=[[Music alloc]initWithName:@"Let It Go" WithImage:[NSImage imageNamed:@"Let it go"] WithTypes:@"欧美" WithAuthor:@"Edward" WithIntroduction:@"歌词" WithCommentMutableArray:commentMutableArray1 WithScore:5 WithIsFavorite:NO];
    Music *music2=[[Music alloc]initWithName:@"You are beautiful" WithImage:[NSImage imageNamed:@"Let it go"] WithTypes:@"欧美" WithAuthor:@"Edward" WithIntroduction:@"歌词" WithCommentMutableArray:commentMutableArray2 WithScore:5 WithIsFavorite:NO];
    Music *music3=[[Music alloc]initWithName:@"Hero" WithImage:[NSImage imageNamed:@"Let it go"] WithTypes:@"欧美" WithAuthor:@"Edward" WithIntroduction:@"歌词" WithCommentMutableArray:commentMutableArray3 WithScore:4.5 WithIsFavorite:NO];
    Music *music4=[[Music alloc]initWithName:@"The World" WithImage:[NSImage imageNamed:@"Let it go"] WithTypes:@"欧美" WithAuthor:@"Edward" WithIntroduction:@"歌词" WithCommentMutableArray:commentMutableArray4 WithScore:5 WithIsFavorite:NO];
    Music *music5=[[Music alloc]initWithName:@"You rise me up" WithImage:[NSImage imageNamed:@"Let it go"] WithTypes:@"欧美" WithAuthor:@"Edward" WithIntroduction:@"歌词" WithCommentMutableArray:commentMutableArray5 WithScore:4.5 WithIsFavorite:NO];
    Music *music6=[[Music alloc]initWithName:@"Apologize" WithImage:[NSImage imageNamed:@"Let it go"] WithTypes:@"欧美" WithAuthor:@"Edward" WithIntroduction:@"歌词" WithCommentMutableArray:commentMutableArray6 WithScore:5 WithIsFavorite:NO];
    Music *music7=[[Music alloc]initWithName:@"Califonia Hotel" WithImage:[NSImage imageNamed:@"Let it go"] WithTypes:@"欧美" WithAuthor:@"Edward" WithIntroduction:@"歌词" WithCommentMutableArray:commentMutableArray7 WithScore:5 WithIsFavorite:NO];
    Music *music8=[[Music alloc]initWithName:@"My Love" WithImage:[NSImage imageNamed:@"Let it go"] WithTypes:@"欧美" WithAuthor:@"Edward" WithIntroduction:@"歌词" WithCommentMutableArray:commentMutableArray8 WithScore:5 WithIsFavorite:NO];
    Music *music9=[[Music alloc]initWithName:@"Sunshine" WithImage:[NSImage imageNamed:@"Let it go"] WithTypes:@"欧美" WithAuthor:@"Edward" WithIntroduction:@"歌词" WithCommentMutableArray:commentMutableArray9 WithScore:4 WithIsFavorite:NO];
    Music *music10=[[Music alloc]initWithName:@"Friend" WithImage:[NSImage imageNamed:@"Let it go"] WithTypes:@"欧美" WithAuthor:@"Edward" WithIntroduction:@"歌词" WithCommentMutableArray:commentMutableArray10 WithScore:4 WithIsFavorite:NO];
    Music *music11=[[Music alloc]initWithName:@"Never Give Up" WithImage:[NSImage imageNamed:@"Let it go"] WithTypes:@"欧美" WithAuthor:@"Edward" WithIntroduction:@"歌词" WithCommentMutableArray:commentMutableArray11 WithScore:4.5 WithIsFavorite:NO];
    Music *music12=[[Music alloc]initWithName:@"Think" WithImage:[NSImage imageNamed:@"Let it go"] WithTypes:@"欧美" WithAuthor:@"Edward" WithIntroduction:@"歌词" WithCommentMutableArray:commentMutableArray12 WithScore:5 WithIsFavorite:NO];
    Music *music13=[[Music alloc]initWithName:@"Impossible" WithImage:[NSImage imageNamed:@"Let it go"] WithTypes:@"欧美" WithAuthor:@"Edward" WithIntroduction:@"歌词" WithCommentMutableArray:commentMutableArray13 WithScore:3 WithIsFavorite:NO];
    Music *music14=[[Music alloc]initWithName:@"Worry" WithImage:[NSImage imageNamed:@"Let it go"] WithTypes:@"欧美" WithAuthor:@"Edward" WithIntroduction:@"歌词" WithCommentMutableArray:commentMutableArray14 WithScore:3 WithIsFavorite:NO];
    Music *music15=[[Music alloc]initWithName:@"Littel Star" WithImage:[NSImage imageNamed:@"Let it go"] WithTypes:@"欧美" WithAuthor:@"Edward" WithIntroduction:@"歌词" WithCommentMutableArray:commentMutableArray15 WithScore:3.5 WithIsFavorite:NO];
    Music *music16=[[Music alloc]initWithName:@"Ghost" WithImage:[NSImage imageNamed:@"Let it go"] WithTypes:@"欧美" WithAuthor:@"Edward" WithIntroduction:@"歌词" WithCommentMutableArray:commentMutableArray16 WithScore:4 WithIsFavorite:NO];
    Music *music17=[[Music alloc]initWithName:@"Happiness" WithImage:[NSImage imageNamed:@"Let it go"] WithTypes:@"欧美" WithAuthor:@"Edward" WithIntroduction:@"歌词" WithCommentMutableArray:commentMutableArray17 WithScore:4 WithIsFavorite:NO];
    Music *music18=[[Music alloc]initWithName:@"Thankful" WithImage:[NSImage imageNamed:@"Let it go"] WithTypes:@"欧美" WithAuthor:@"Edward" WithIntroduction:@"歌词" WithCommentMutableArray:commentMutableArray18 WithScore:5 WithIsFavorite:NO];
    Music *music19=[[Music alloc]initWithName:@"God is a girl" WithImage:[NSImage imageNamed:@"Let it go"] WithTypes:@"欧美" WithAuthor:@"Edward" WithIntroduction:@"歌词" WithCommentMutableArray:commentMutableArray19 WithScore:2 WithIsFavorite:NO];
    Music *music20=[[Music alloc]initWithName:@"Heaven" WithImage:[NSImage imageNamed:@"Let it go"] WithTypes:@"欧美" WithAuthor:@"Edward" WithIntroduction:@"歌词" WithCommentMutableArray:commentMutableArray20 WithScore:4 WithIsFavorite:NO];
    
    NSMutableArray *musicMutableArray=[[NSMutableArray alloc]initWithObjects:music1,music2,music3,music4,music5,music6,music7,music8,music9,music10,music11,music12,music13,music14,music15,music16,music17,music18,music19,music20, nil];
    [AppDelegate setStaticMusicMutableArray:musicMutableArray];

}
-(void)initMovieValue{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    
    NSString *currentTime=[dateFormatter stringFromDate:[NSDate date]];
    Message *firstMessage=[[Message alloc]initWithSender:@"楼主" WithComment:@"沙发，欢迎评论！" WithTime:currentTime];
    NSMutableArray *commentMutableArray1=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray2=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray3=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray4=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray5=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray6=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray7=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray8=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray9=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray10=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray11=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray12=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray13=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray14=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray15=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray16=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray17=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray18=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray19=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    NSMutableArray *commentMutableArray20=[[NSMutableArray alloc]initWithObjects:firstMessage, nil];
    
    Movie *movie1=[[Movie alloc]initWithName:@"澳门风云" WithImage:[NSImage imageNamed:@"澳门风云"] WithTypes:@"剧情" WithAuthor:@"Coco" WithIntroduction:@"剧情简介" WithCommentMutableArray:commentMutableArray1 WithScore:5.0 WithIsFavorite:NO];
    Movie *movie2=[[Movie alloc]initWithName:@"精武门" WithImage:[NSImage imageNamed:@"澳门风云"] WithTypes:@"剧情" WithAuthor:@"Coco" WithIntroduction:@"剧情简介" WithCommentMutableArray:commentMutableArray2 WithScore:4.9 WithIsFavorite:NO];
    Movie *movie3=[[Movie alloc]initWithName:@"色即是空" WithImage:[NSImage imageNamed:@"澳门风云"] WithTypes:@"剧情" WithAuthor:@"Coco" WithIntroduction:@"剧情简介" WithCommentMutableArray:commentMutableArray3 WithScore:3.0 WithIsFavorite:NO];
    Movie *movie4=[[Movie alloc]initWithName:@"笑傲江湖" WithImage:[NSImage imageNamed:@"澳门风云"] WithTypes:@"剧情" WithAuthor:@"Coco" WithIntroduction:@"剧情简介" WithCommentMutableArray:commentMutableArray4 WithScore:3.5 WithIsFavorite:NO];
    Movie *movie5=[[Movie alloc]initWithName:@"西游记" WithImage:[NSImage imageNamed:@"澳门风云"] WithTypes:@"剧情" WithAuthor:@"Coco" WithIntroduction:@"剧情简介" WithCommentMutableArray:commentMutableArray5 WithScore:4.5 WithIsFavorite:NO];
    Movie *movie6=[[Movie alloc]initWithName:@"美人鱼" WithImage:[NSImage imageNamed:@"澳门风云"] WithTypes:@"剧情" WithAuthor:@"Coco" WithIntroduction:@"剧情简介" WithCommentMutableArray:commentMutableArray6 WithScore:3.0 WithIsFavorite:NO];
    Movie *movie7=[[Movie alloc]initWithName:@"三打白骨精" WithImage:[NSImage imageNamed:@"澳门风云"] WithTypes:@"剧情" WithAuthor:@"Coco" WithIntroduction:@"剧情简介" WithCommentMutableArray:commentMutableArray7 WithScore:2.0 WithIsFavorite:NO];
    Movie *movie8=[[Movie alloc]initWithName:@"功夫熊猫" WithImage:[NSImage imageNamed:@"澳门风云"] WithTypes:@"剧情" WithAuthor:@"Coco" WithIntroduction:@"剧情简介" WithCommentMutableArray:commentMutableArray8 WithScore:2.5 WithIsFavorite:NO];
    Movie *movie9=[[Movie alloc]initWithName:@"水浒传" WithImage:[NSImage imageNamed:@"澳门风云"] WithTypes:@"剧情" WithAuthor:@"Coco" WithIntroduction:@"剧情简介" WithCommentMutableArray:commentMutableArray9 WithScore:3.0 WithIsFavorite:NO];
    Movie *movie10=[[Movie alloc]initWithName:@"三国演义" WithImage:[NSImage imageNamed:@"澳门风云"] WithTypes:@"剧情" WithAuthor:@"Coco" WithIntroduction:@"剧情简介" WithCommentMutableArray:commentMutableArray10 WithScore:3.5 WithIsFavorite:NO];
    Movie *movie11=[[Movie alloc]initWithName:@"红楼梦" WithImage:[NSImage imageNamed:@"澳门风云"] WithTypes:@"剧情" WithAuthor:@"Coco" WithIntroduction:@"剧情简介" WithCommentMutableArray:commentMutableArray11 WithScore:4.0 WithIsFavorite:NO];
    Movie *movie12=[[Movie alloc]initWithName:@"鹿鼎记" WithImage:[NSImage imageNamed:@"澳门风云"] WithTypes:@"剧情" WithAuthor:@"Coco" WithIntroduction:@"剧情简介" WithCommentMutableArray:commentMutableArray12 WithScore:4.2 WithIsFavorite:NO];
    Movie *movie13=[[Movie alloc]initWithName:@"大话西游" WithImage:[NSImage imageNamed:@"澳门风云"] WithTypes:@"剧情" WithAuthor:@"Coco" WithIntroduction:@"剧情简介" WithCommentMutableArray:commentMutableArray13 WithScore:4.5 WithIsFavorite:NO];
    Movie *movie14=[[Movie alloc]initWithName:@"九品芝麻官" WithImage:[NSImage imageNamed:@"澳门风云"] WithTypes:@"剧情" WithAuthor:@"Coco" WithIntroduction:@"剧情简介" WithCommentMutableArray:commentMutableArray14 WithScore:4.6 WithIsFavorite:NO];
    Movie *movie15=[[Movie alloc]initWithName:@"大内密探" WithImage:[NSImage imageNamed:@"澳门风云"] WithTypes:@"剧情" WithAuthor:@"Coco" WithIntroduction:@"剧情简介" WithCommentMutableArray:commentMutableArray15 WithScore:4.7 WithIsFavorite:NO];
    Movie *movie16=[[Movie alloc]initWithName:@"情深深雨蒙蒙" WithImage:[NSImage imageNamed:@"澳门风云"] WithTypes:@"剧情" WithAuthor:@"Coco" WithIntroduction:@"剧情简介" WithCommentMutableArray:commentMutableArray16 WithScore:4.8 WithIsFavorite:NO];
    Movie *movie17=[[Movie alloc]initWithName:@"黄飞鸿" WithImage:[NSImage imageNamed:@"澳门风云"] WithTypes:@"剧情" WithAuthor:@"Coco" WithIntroduction:@"剧情简介" WithCommentMutableArray:commentMutableArray17 WithScore:4.0 WithIsFavorite:NO];
    Movie *movie18=[[Movie alloc]initWithName:@"东方不败" WithImage:[NSImage imageNamed:@"澳门风云"] WithTypes:@"剧情" WithAuthor:@"Coco" WithIntroduction:@"剧情简介" WithCommentMutableArray:commentMutableArray18 WithScore:3.0 WithIsFavorite:NO];
    Movie *movie19=[[Movie alloc]initWithName:@"神雕侠侣" WithImage:[NSImage imageNamed:@"澳门风云"] WithTypes:@"剧情" WithAuthor:@"Coco" WithIntroduction:@"剧情简介" WithCommentMutableArray:commentMutableArray19 WithScore:4.9 WithIsFavorite:NO];
    Movie *movie20=[[Movie alloc]initWithName:@"光头强" WithImage:[NSImage imageNamed:@"澳门风云"] WithTypes:@"剧情" WithAuthor:@"Coco" WithIntroduction:@"剧情简介" WithCommentMutableArray:commentMutableArray20 WithScore:5.0 WithIsFavorite:NO];
    
    NSMutableArray *movieMutableArray=[[NSMutableArray alloc]initWithObjects:movie1,movie2,movie3,movie4,movie5,movie6,movie7,movie8,movie9,movie10,movie11,movie12,movie13,movie14,movie15,movie16,movie17,movie18,movie19,movie20, nil];
    [AppDelegate setStaticMovieMutableArray:movieMutableArray];
    [AppDelegate setStaticMovieScoreRankingMutableArray:movieMutableArray];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [self readingUserCoreData];
    [self initMusicValue];
    [self initMovieValue];
    self.mainWindowController=[[MainWindowController alloc]initWithWindowNibName:@"MainWindow"];
    BOOL accountState=NO;
    [AppDelegate setStaticAcccountState:accountState];
}



+(BOOL)getStaticAccountState{
    return staticAccountState;
}

+(BOOL)setStaticAcccountState:(BOOL)newAccountState{

    staticAccountState=newAccountState;
    return staticAccountState;
}

+(NSMutableArray *)getStaticMovieMutableArray{
    return staticMovieMutableArray;
}
+(NSMutableArray *)setStaticMovieMutableArray:(NSMutableArray *)newMovieMutableArray{
    staticMovieMutableArray=newMovieMutableArray;
    return staticMovieMutableArray;
}

+(NSMutableArray *)getStaticMovieScoreRankingMutableArray{
    return staticMovieScoreRankingMutableArray;
}
+(NSMutableArray *)setStaticMovieScoreRankingMutableArray:(NSMutableArray *)newMovieMutableArray{
    staticMovieScoreRankingMutableArray=newMovieMutableArray;
    return staticMovieScoreRankingMutableArray;
}

+(NSMutableArray *)getStaticMusicMutableArray{
    return staticMusicMutableArray;
}
+(NSMutableArray *)setStaticMusicMutableArray:(NSMutableArray *)newMusicMutableArray{
    staticMusicMutableArray=newMusicMutableArray;
    return staticMusicMutableArray;
}

+(Movie *)getStaticMovie{
    return  staticMovie;
}

+(Movie *)setStaticMovie:(Movie *)newMovie{
    staticMovie=newMovie;
    return staticMovie;
}

+(Music *)getStaticMusic{
    return staticMusic;
}
+(Music *)setStaticMusic:(Music *)newMusic{
    staticMusic=newMusic;
    return staticMusic;
}

+(Movie *)getStaticScoreRankingMovie{
    return  staticScoreRankingMovie;
}

+(Movie *)setStaticScoreRankingMovie:(Movie *)newMovie{
    staticScoreRankingMovie=newMovie;
    return staticScoreRankingMovie;
}

+(User *)getStaticUser{
    return  staticUser;
}

+(User *)setStaticUser:(User *)newUser{
    staticUser=newUser;
    return staticUser;
}

+(NSInteger)getStaticUserRow{
    return staticUserRow;
}
+(NSInteger)setStaticUserRow:(NSInteger)row{
    staticUserRow=row;
    return staticUserRow;
}

+(NSMutableArray *)getStaticUserMutableArray{
    return staticUserMutableArray;
}
+(NSMutableArray *)setstaticUserMutableArray:(NSMutableArray *)newUserMutableArray{
    staticUserMutableArray=newUserMutableArray;
    return staticUserMutableArray;

}

+(NSMutableArray *)getStaticFavoriteListMutableArray{
    return staticFavoriteListMutableArray;
}
+(NSMutableArray *)setstaticFavoriteListMutableArray:(NSMutableArray *)newFavoriteMutableArray{
    staticFavoriteListMutableArray=newFavoriteMutableArray;
    return staticFavoriteListMutableArray;
}

+(NSMutableArray *)getStaticMusicFavoriteListMutableArray{
    return  staticMusicFavoriteListMutableArray;
}
+(NSMutableArray *)setstaticMusicFavoriteListMutableArray:(NSMutableArray *)newMusicFavoriteMutableArray{
    staticMusicFavoriteListMutableArray=newMusicFavoriteMutableArray;
    return staticMusicFavoriteListMutableArray;
}

+(NSMutableArray *)getStaticHistoryListMutableArray{
    return staticHistoryListMutableArray;
}
+(NSMutableArray *)setstaticHistoryListMutableArray:(NSMutableArray *)newHistoryListMutableArray{
    staticHistoryListMutableArray=newHistoryListMutableArray;
    return staticHistoryListMutableArray;
}

+(NSMutableArray *)getStaticMusicHistoryListMutableArray{
    return staticMusicHistoryListMutableArray;
}
+(NSMutableArray *)setstaticMusicHistoryListMutableArray:(NSMutableArray *)newMusicHistoryListMutableArray{
    staticMusicHistoryListMutableArray=newMusicHistoryListMutableArray;
    return staticMusicHistoryListMutableArray;
}

+(NSInteger)getStaticMovieRow{
    return staticMovieRow;
}
+(NSInteger)setStaticMovieRow:(NSInteger)row{
    staticMovieRow=row;
    return staticMovieRow;
}

+(NSInteger)getStaticMusicRow{
    return staticMusicRow;
}
+(NSInteger)setStaticMusicRow:(NSInteger)row{
    staticMusicRow=row;
    return staticMusicRow;
}

#pragma mark - Core Data stack

@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize managedObjectContext = _managedObjectContext;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "ED.MyMoment" in the user's Application Support directory.
    NSURL *appSupportURL = [[[NSFileManager defaultManager] URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask] lastObject];
    return [appSupportURL URLByAppendingPathComponent:@"ED.MyMoment"];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel) {
        return _managedObjectModel;
    }
   // create Entity;
  //  NSEntityDescription *userEntity=[[NSEntityDescription alloc]init];
  //  [userEntity setName:@"TestUser"];
  //  [userEntity setManagedObjectClassName:@"TestUser"];
  //  [_managedObjectModel setEntities:[NSArray arrayWithObjects:userEntity, nil]];
    
   //add attributes
    
  //  NSAttributeDescription *testUserAttribute=[[NSAttributeDescription alloc]init];
  //  [testUserAttribute setName:@"testUserData"];
  //  [testUserAttribute setAttributeType:NSBinaryDataAttributeType];
  //  [testUserAttribute setOptional:NO];
	
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"MyMoment" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. (The directory for the store is created, if necessary.)
    if (_persistentStoreCoordinator) {
        return _persistentStoreCoordinator;
    }
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *applicationDocumentsDirectory = [self applicationDocumentsDirectory];
    BOOL shouldFail = NO;
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    
    // Make sure the application files directory is there
    NSDictionary *properties = [applicationDocumentsDirectory resourceValuesForKeys:@[NSURLIsDirectoryKey] error:&error];
    if (properties) {
        if (![properties[NSURLIsDirectoryKey] boolValue]) {
            failureReason = [NSString stringWithFormat:@"Expected a folder to store application data, found a file (%@).", [applicationDocumentsDirectory path]];
            shouldFail = YES;
        }
    } else if ([error code] == NSFileReadNoSuchFileError) {
        error = nil;
        [fileManager createDirectoryAtPath:[applicationDocumentsDirectory path] withIntermediateDirectories:YES attributes:nil error:&error];
    }
    
    if (!shouldFail && !error) {
        NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
        NSURL *url = [applicationDocumentsDirectory URLByAppendingPathComponent:@"OSXCoreDataObjC.storedata"];
        if (![coordinator addPersistentStoreWithType:NSXMLStoreType configuration:nil URL:url options:nil error:&error]) {
            coordinator = nil;
        }
        _persistentStoreCoordinator = coordinator;
    }
    
    if (shouldFail || error) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        if (error) {
            dict[NSUnderlyingErrorKey] = error;
        }
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        [[NSApplication sharedApplication] presentError:error];
    }
    return _persistentStoreCoordinator;
}

- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];

    return _managedObjectContext;
}

#pragma mark - Core Data Saving and Undo support

- (IBAction)saveAction:(id)sender {
    // Performs the save action for the application, which is to send the save: message to the application's managed object context. Any encountered errors are presented to the user.
    if (![[self managedObjectContext] commitEditing]) {
        NSLog(@"%@:%@ unable to commit editing before saving", [self class], NSStringFromSelector(_cmd));
    }
    
    NSError *error = nil;
    if ([[self managedObjectContext] hasChanges] && ![[self managedObjectContext] save:&error]) {
        [[NSApplication sharedApplication] presentError:error];
    }
}

- (NSUndoManager *)windowWillReturnUndoManager:(NSWindow *)window {
    // Returns the NSUndoManager for the application. In this case, the manager returned is that of the managed object context for the application.
    return [[self managedObjectContext] undoManager];
}

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender {
    // Save changes in the application's managed object context before the application terminates.
    
    if (!_managedObjectContext) {
        return NSTerminateNow;
    }
    
    if (![[self managedObjectContext] commitEditing]) {
        NSLog(@"%@:%@ unable to commit editing to terminate", [self class], NSStringFromSelector(_cmd));
        return NSTerminateCancel;
    }
    
    if (![[self managedObjectContext] hasChanges]) {
        return NSTerminateNow;
    }
    
    NSError *error = nil;
    if (![[self managedObjectContext] save:&error]) {

        // Customize this code block to include application-specific recovery steps.              
        BOOL result = [sender presentError:error];
        if (result) {
            return NSTerminateCancel;
        }

        NSString *question = NSLocalizedString(@"Could not save changes while quitting. Quit anyway?", @"Quit without saves error question message");
        NSString *info = NSLocalizedString(@"Quitting now will lose any changes you have made since the last successful save", @"Quit without saves error question info");
        NSString *quitButton = NSLocalizedString(@"Quit anyway", @"Quit anyway button title");
        NSString *cancelButton = NSLocalizedString(@"Cancel", @"Cancel button title");
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setMessageText:question];
        [alert setInformativeText:info];
        [alert addButtonWithTitle:quitButton];
        [alert addButtonWithTitle:cancelButton];

        NSInteger answer = [alert runModal];
        
        if (answer == NSAlertFirstButtonReturn) {
            return NSTerminateCancel;
        }
    }

    return NSTerminateNow;
}

@end
