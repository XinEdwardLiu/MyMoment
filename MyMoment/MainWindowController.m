//
//  MainWindowController.m
//  MyMoment
//
//  Created by Edward Liu on 16/3/16.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import "MainWindowController.h"
#import "RigisterViewController.h"
#import "MovieDetailViewController.h"
#import "AppDelegate.h"
#import "UserCoreData.h"



@interface MainWindowController ()


@end

@implementation MainWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    self.window.titleVisibility=NSWindowTitleHidden;
    self.window.titlebarAppearsTransparent=YES;
    self.window.styleMask|=NSFullSizeContentViewWindowMask;
    self.window.backgroundColor=[NSColor purpleColor];
    
    self.registerViewController=[[RigisterViewController alloc]initWithNibName:@"RigisterViewController" bundle:nil];
    NSRect rigsterFrame=NSMakeRect(0, 47.5, 179, 468);
    [self.registerViewController.view setFrame:rigsterFrame];
    
      [self.window.contentView addSubview:self.registerViewController.view];
    self.mainView=[self.mainTab tabViewItemAtIndex:0].view;
    self.movieView=[self.mainTab tabViewItemAtIndex:1].view;
    self.musicView=[self.mainTab tabViewItemAtIndex:2].view;
    

    //self.mainMovieScrollView.hasHorizontalScroller=YES;
    //[self.mainMovieScrollView setNeedsDisplay:YES];
    
}




-(BOOL)windowShouldClose:(id)sender{
    
    //save data when app closed
 //   AppDelegate *appdelegate=[NSApp delegate];
 //   NSMutableArray *tempUserMutableArray=[[NSMutableArray alloc]initWithArray:[AppDelegate getStaticUserMutableArray]];
 //   UserCoreData *userCoreData=[[UserCoreData alloc]initWithEntity:[NSEntityDescription entityForName:@"UserCoreData" inManagedObjectContext:[appdelegate managedObjectContext]] insertIntoManagedObjectContext:appdelegate.managedObjectContext];
 //   userCoreData.userArrayData=[NSKeyedArchiver archivedDataWithRootObject:tempUserMutableArray];
 //   NSError *error=nil;
 //   [appdelegate.managedObjectContext save:&error];
    
    // save end
    
    return YES;
}



-(id)initWithWindowNibName:(NSString *)windowNibName{

    if (self=[super initWithWindowNibName:windowNibName]) {
        [self showWindow:self];
       
    }
    return self;
}
-(IBAction)clickMainBtn:(id)sender{
    NSRect showFrame=NSMakeRect(179, 47.5, 846, 468);
   
    [self.mainView setFrame:showFrame];
    [self.movieView setHidden:YES];
    [self.mainView setHidden:NO];
    [self.musicView setHidden:YES];
    
    [self.window.contentView addSubview:self.mainView];
    
    [self.mainBtn setImage:[NSImage imageNamed:@"Main_Yellow"]];
    [self.movieBtn setImage:[NSImage imageNamed:@"Movie"]];
    [self.musicBtn setImage:[NSImage imageNamed:@"Music"]];
    
    [self.movieDetailViewController.view setHidden:YES];
    [self.registerViewController.registerView setHidden:YES];
    [self.registerViewController.modifyView setHidden:YES];
    [self.registerViewController.favoriteView setHidden:YES];
    
}

-(IBAction)clickMovieBtn:(id)sender{
    
    [self.movieBtn setImage:[NSImage imageNamed:@"Movie_Yellow"]];
    [self.mainBtn setImage:[NSImage imageNamed:@"Main"]];
    [self.musicBtn setImage:[NSImage imageNamed:@"Music"]];
    
    [self.movieScoreRankingTableView reloadData];
    NSRect showFrame=NSMakeRect(179, 47.5, 846, 468);
    [self.movieView setFrame:showFrame];
    [self.mainView setHidden:YES];
    [self.movieView setHidden:NO];
    [self.window.contentView addSubview:self.movieView];
    [self.movieDetailView setHidden:YES];
    [self.musicView setHidden:YES];
    [self.registerViewController.registerView setHidden:YES];
    [self.registerViewController.modifyView setHidden:YES];
      [self.registerViewController.favoriteView setHidden:YES];
}

-(IBAction)clickMusicBtn:(id)sender{
    
    [self.musicBtn setImage:[NSImage imageNamed:@"Music_Yellow"]];
    [self.mainBtn setImage:[NSImage imageNamed:@"Main"]];
    [self.movieBtn setImage:[NSImage imageNamed:@"Movie"]];
    
NSRect showFrame=NSMakeRect(179, 47.5, 846, 468);
    [self.musicView setFrame:showFrame];
    [self.mainView setHidden:YES];
    [self.movieView setHidden:YES];
    [self.movieDetailView setHidden:YES];
    [self.musicView setHidden:NO];
    [self.window.contentView addSubview:self.musicView];
    [self.registerViewController.registerView setHidden:YES];
    [self.registerViewController.modifyView setHidden:YES];
      [self.registerViewController.favoriteView setHidden:YES];

}


-(IBAction)clickMovieImageBtn:(id)sender{
NSRect showFrame=NSMakeRect(179, 47.5, 846, 468);
    self.movieDetailViewController=[[MovieDetailViewController alloc]initWithNibName:@"MovieDetailViewController" bundle:nil];
    self.movieDetailView=self.movieDetailViewController.view;
    [self.movieDetailView setFrame:showFrame];
    [self.movieView setHidden:YES];
    [self.window.contentView addSubview:self.movieDetailView];

}


-(IBAction)clickMovieTableView:(id)sender{
    NSInteger row=self.mainMovieTableView.selectedRow;
    
    NSMutableArray *mainMovieMutableArray=[AppDelegate getStaticMovieMutableArray];
    Movie *selectedMovie=[mainMovieMutableArray objectAtIndex:row];
    [AppDelegate setStaticMovie:selectedMovie];
    
    NSRect showFrame=NSMakeRect(179, 47.5, 846, 468);
    self.movieDetailViewController=[[MovieDetailViewController alloc]initWithNibName:@"MovieDetailViewController" bundle:nil];
    self.movieDetailView=self.movieDetailViewController.view;
    [self.movieDetailView setFrame:showFrame];
    [self.mainView setHidden:YES];
    [self.window.contentView addSubview:self.movieDetailView];
}

-(IBAction)clickMovieAllTableView:(id)sender{
    NSInteger row=self.movieAllTableView.selectedRow;
    
    NSMutableArray *mainMovieMutableArray=[AppDelegate getStaticMovieMutableArray];
    Movie *selectedMovie=[mainMovieMutableArray objectAtIndex:row];
    [AppDelegate setStaticMovie:selectedMovie];
    
    NSRect showFrame=NSMakeRect(179, 47.5, 846, 468);
    self.movieDetailViewController=[[MovieDetailViewController alloc]initWithNibName:@"MovieDetailViewController" bundle:nil];
    self.movieDetailView=self.movieDetailViewController.view;
    [self.movieDetailView setFrame:showFrame];
    [self.mainView setHidden:YES];
    [self.movieView setHidden:YES];
    [self.window.contentView addSubview:self.movieDetailView];
}

-(IBAction)clickMovieScoreRankingTableView:(id)sender{
    NSInteger row=self.movieScoreRankingTableView.selectedRow;
    
    NSMutableArray *mainMovieMutableArray=[AppDelegate getStaticMovieMutableArray];
    
    NSSortDescriptor *scoreDescriptor = [[NSSortDescriptor alloc] initWithKey:@"score" ascending:NO];
    NSArray *sortDescriptors = @[scoreDescriptor];
    NSArray *sortedArray = [mainMovieMutableArray sortedArrayUsingDescriptors:sortDescriptors];
    
    
    NSMutableArray *mainMovieScoreRankingMutaleArray=[[NSMutableArray alloc]initWithArray:sortedArray];
    
    Movie *selectedMovie=[mainMovieScoreRankingMutaleArray objectAtIndex:row];
    //[AppDelegate setStaticScoreRankingMovie:selectedMovie];
    [AppDelegate setStaticMovie:selectedMovie];
    
    NSRect showFrame=NSMakeRect(179, 47.5, 846, 468);
    self.movieDetailViewController=[[MovieDetailViewController alloc]initWithNibName:@"MovieDetailViewController" bundle:nil];
    self.movieDetailView=self.movieDetailViewController.view;
    [self.movieDetailView setFrame:showFrame];
    [self.mainView setHidden:YES];
    [self.movieView setHidden:YES];
    [self.window.contentView addSubview:self.movieDetailView];
    

}


@end
