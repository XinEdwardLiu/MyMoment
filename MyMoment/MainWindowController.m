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
#import "MusicDetailViewController.h"
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
    self.searchResultViewController=[[SearchResultViewController alloc]initWithNibName:@"SearchResultViewController" bundle:nil];
}

-(id)initWithWindowNibName:(NSString *)windowNibName{

    if (self=[super initWithWindowNibName:windowNibName]) {
        [self showWindow:self];
       
    }
    return self;
}
-(IBAction)clickMainBtn:(id)sender{
    NSRect showFrame=NSMakeRect(179, 47.5, 846, 468);
    [self.mainView setHidden:NO];
    [self.mainView setFrame:showFrame];
    [self.movieView setHidden:YES];
    [self.searchResultViewController.view setHidden:YES];
    [self.musicView setHidden:YES];
    [self.window.contentView addSubview:self.mainView];
    
    [self.mainBtn setImage:[NSImage imageNamed:@"Main_Yellow"]];
    [self.movieBtn setImage:[NSImage imageNamed:@"Movie"]];
    [self.musicBtn setImage:[NSImage imageNamed:@"Music"]];
    
    [self.movieDetailViewController.view setHidden:YES];
    [self dismissController:self.registerViewController];
    [self.registerViewController.registerView setHidden:YES];
    [self.registerViewController.modifyView setHidden:YES];
    [self.registerViewController.favoriteView setHidden:YES];
    [self.registerViewController.historyView setHidden:YES];
    [self.musicDetailViewController.view setHidden:YES];
  
    
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
    [self.searchResultView setHidden:YES];
    [self.registerViewController.registerView setHidden:YES];
    [self.registerViewController.modifyView setHidden:YES];
    [self.registerViewController.favoriteView setHidden:YES];
    [self.registerViewController.historyView setHidden:YES];
    [self.musicDetailViewController.view setHidden:YES];
}

-(IBAction)clickMusicBtn:(id)sender{
    
    [self.musicBtn setImage:[NSImage imageNamed:@"Music_Yellow"]];
    [self.mainBtn setImage:[NSImage imageNamed:@"Main"]];
    [self.movieBtn setImage:[NSImage imageNamed:@"Movie"]];
    
    [self.musicScoreRankingTableView reloadData];
    
    NSRect showFrame=NSMakeRect(179, 47.5, 846, 468);
    [self.musicView setFrame:showFrame];
    [self.mainView setHidden:YES];
    [self.movieView setHidden:YES];
    [self.movieDetailView setHidden:YES];
    [self.musicView setHidden:NO];
    [self.searchResultView setHidden:YES];
    [self.window.contentView addSubview:self.musicView];
    [self.registerViewController.registerView setHidden:YES];
    [self.registerViewController.modifyView setHidden:YES];
    [self.registerViewController.favoriteView setHidden:YES];
    [self.registerViewController.historyView setHidden:YES];
    [self.musicDetailView setHidden:YES];

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
    [AppDelegate setStaticMovieRow:row];
    
    NSMutableArray *mainMovieMutableArray=[AppDelegate getStaticMovieMutableArray];
    Movie *selectedMovie=[mainMovieMutableArray objectAtIndex:row];
    [AppDelegate setStaticMovie:selectedMovie];
    
    //
    NSMutableArray *tempHistoryListMutableArray=[[NSMutableArray alloc]initWithArray:[AppDelegate getStaticHistoryListMutableArray]];
    if ([tempHistoryListMutableArray count]==0)
    {
        [tempHistoryListMutableArray addObject:selectedMovie];
    }
    else
    {
        if ([tempHistoryListMutableArray containsObject:selectedMovie])
        {
            [tempHistoryListMutableArray removeObject:selectedMovie];
            [tempHistoryListMutableArray insertObject:selectedMovie atIndex:0];
        }
        else
        {     [tempHistoryListMutableArray insertObject:selectedMovie atIndex:0];
        }
    }
    
    [AppDelegate setstaticHistoryListMutableArray:tempHistoryListMutableArray];
    [self.registerViewController.historyListViewController.historyListTableView reloadData];
    //
    NSRect showFrame=NSMakeRect(179, 47.5, 846, 468);
    self.movieDetailViewController=[[MovieDetailViewController alloc]initWithNibName:@"MovieDetailViewController" bundle:nil];
    self.movieDetailView=self.movieDetailViewController.view;
    //
    
//
    [self.movieDetailView setFrame:showFrame];
    [self.mainView setHidden:YES];
    [self.window.contentView addSubview:self.movieDetailView];
    
}

-(IBAction)clickMovieAllTableView:(id)sender{
    NSInteger row=self.movieAllTableView.selectedRow;
    
    NSMutableArray *mainMovieMutableArray=[AppDelegate getStaticMovieMutableArray];
    Movie *selectedMovie=[mainMovieMutableArray objectAtIndex:row];
    [AppDelegate setStaticMovie:selectedMovie];
    //
    NSMutableArray *tempHistoryListMutableArray=[[NSMutableArray alloc]initWithArray:[AppDelegate getStaticHistoryListMutableArray]];
    if ([tempHistoryListMutableArray count]==0)
    {
        [tempHistoryListMutableArray addObject:selectedMovie];
    }
    else
    {
        if ([tempHistoryListMutableArray containsObject:selectedMovie])
        {
            [tempHistoryListMutableArray removeObject:selectedMovie];
            [tempHistoryListMutableArray insertObject:selectedMovie atIndex:0];
        }
        else
        {     [tempHistoryListMutableArray insertObject:selectedMovie atIndex:0];
            //[tempHistoryListMutableArray addObject:selectedMovie];
        }
    }
    [AppDelegate setstaticHistoryListMutableArray:tempHistoryListMutableArray];
    [self.registerViewController.historyListViewController.historyListTableView reloadData];
   
    //
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
    //
    NSMutableArray *tempHistoryListMutableArray=[[NSMutableArray alloc]initWithArray:[AppDelegate getStaticHistoryListMutableArray]];
    if ([tempHistoryListMutableArray count]==0)
    {
        [tempHistoryListMutableArray addObject:selectedMovie];
    }
    else
    {
        if ([tempHistoryListMutableArray containsObject:selectedMovie])
        {
            [tempHistoryListMutableArray removeObject:selectedMovie];
            [tempHistoryListMutableArray insertObject:selectedMovie atIndex:0];
        }
        else
        {     [tempHistoryListMutableArray insertObject:selectedMovie atIndex:0];
            //[tempHistoryListMutableArray addObject:selectedMovie];
        }
    }
    [AppDelegate setstaticHistoryListMutableArray:tempHistoryListMutableArray];
    [self.registerViewController.historyListViewController.historyListTableView reloadData];
    //
    NSRect showFrame=NSMakeRect(179, 47.5, 846, 468);
    self.movieDetailViewController=[[MovieDetailViewController alloc]initWithNibName:@"MovieDetailViewController" bundle:nil];
    self.movieDetailView=self.movieDetailViewController.view;
    [self.movieDetailView setFrame:showFrame];
    [self.mainView setHidden:YES];
    [self.movieView setHidden:YES];
    [self.window.contentView addSubview:self.movieDetailView];
}


-(IBAction)clickMusicTableView:(id)sender{
    NSInteger row=self.mainMusicTableView.selectedRow;
    [AppDelegate setStaticMusicRow:row];
    
    NSMutableArray *mainMusicMutableArray=[AppDelegate getStaticMusicMutableArray];
    Music *selectedMusic=[mainMusicMutableArray objectAtIndex:row];
    [AppDelegate setStaticMusic:selectedMusic];
    
    //
    NSMutableArray *tempMusicHistoryListMutableArray=[[NSMutableArray alloc]initWithArray:[AppDelegate getStaticMusicHistoryListMutableArray]];
    if ([tempMusicHistoryListMutableArray count]==0)
    {
        [tempMusicHistoryListMutableArray addObject:selectedMusic];
    }
    else
    {
        if ([tempMusicHistoryListMutableArray containsObject:selectedMusic])
        {
            [tempMusicHistoryListMutableArray removeObject:selectedMusic];
            [tempMusicHistoryListMutableArray insertObject:selectedMusic atIndex:0];
        }
        else
        {     [tempMusicHistoryListMutableArray insertObject:selectedMusic atIndex:0];
        }
    }
    
    [AppDelegate setstaticMusicHistoryListMutableArray:tempMusicHistoryListMutableArray];
    [self.registerViewController.historyListViewController.musicHistoryListTableView reloadData];
    //
    
    NSRect showFrame=NSMakeRect(179, 47.5, 846, 468);
    self.musicDetailViewController=[[MusicDetailViewController alloc]initWithNibName:@"MusicDetailViewController" bundle:nil];
    self.musicDetailView=self.musicDetailViewController.view;

    [self.musicDetailView setFrame:showFrame];
    [self.mainView setHidden:YES];
    [self.window.contentView addSubview:self.musicDetailView];
}

-(IBAction)clickAllMusicTableView:(id)sender{
    NSInteger row=self.musicAllTableView.selectedRow;
    NSMutableArray *mainMusicMutableArray=[AppDelegate getStaticMusicMutableArray];
    Music *selectedMusic=[mainMusicMutableArray objectAtIndex:row];
    [AppDelegate setStaticMusic:selectedMusic];
    
    //
    NSMutableArray *tempMusicHistoryListMutableArray=[[NSMutableArray alloc]initWithArray:[AppDelegate getStaticMusicHistoryListMutableArray]];
    if ([tempMusicHistoryListMutableArray count]==0)
    {
        [tempMusicHistoryListMutableArray addObject:selectedMusic];
    }
    else
    {
        if ([tempMusicHistoryListMutableArray containsObject:selectedMusic])
        {
            [tempMusicHistoryListMutableArray removeObject:selectedMusic];
            [tempMusicHistoryListMutableArray insertObject:selectedMusic atIndex:0];
        }
        else
        {     [tempMusicHistoryListMutableArray insertObject:selectedMusic atIndex:0];
        }
    }
    
    [AppDelegate setstaticMusicHistoryListMutableArray:tempMusicHistoryListMutableArray];
    [self.registerViewController.historyListViewController.musicHistoryListTableView reloadData];
    //
    NSRect showFrame=NSMakeRect(179, 47.5, 846, 468);
    self.musicDetailViewController=[[MusicDetailViewController alloc]initWithNibName:@"MusicDetailViewController" bundle:nil];
    self.musicDetailView=self.musicDetailViewController.view;
    [self.musicDetailView setFrame:showFrame];
    [self.mainView setHidden:YES];
    [self.movieView setHidden:YES];
    [self.musicView setHidden:YES];
    [self.window.contentView addSubview:self.musicDetailView];
}

-(IBAction)clickMusicScoreRankingTableView:(id)sender{
    NSInteger row=self.musicScoreRankingTableView.selectedRow;
    NSMutableArray *musicMutableArray=[[NSMutableArray alloc]initWithArray:[AppDelegate getStaticMusicMutableArray]];
    NSSortDescriptor *scoreSortDescriptor=[[NSSortDescriptor alloc]initWithKey:@"score" ascending:NO];
    NSArray *scoreSortArray=@[scoreSortDescriptor];
    NSArray *sortedArray=[musicMutableArray sortedArrayUsingDescriptors:scoreSortArray];
    NSMutableArray *musicScoreRankingMutaleArray=[[NSMutableArray alloc]initWithArray:sortedArray];
    
    Music *selectedMusic=[musicScoreRankingMutaleArray objectAtIndex:row];
    [AppDelegate setStaticMusic:selectedMusic];
    //
    NSMutableArray *tempMusicHistoryListMutableArray=[[NSMutableArray alloc]initWithArray:[AppDelegate getStaticMusicHistoryListMutableArray]];
    if ([tempMusicHistoryListMutableArray count]==0)
    {
        [tempMusicHistoryListMutableArray addObject:selectedMusic];
    }
    else
    {
        if ([tempMusicHistoryListMutableArray containsObject:selectedMusic])
        {
            [tempMusicHistoryListMutableArray removeObject:selectedMusic];
            [tempMusicHistoryListMutableArray insertObject:selectedMusic atIndex:0];
        }
        else
        {     [tempMusicHistoryListMutableArray insertObject:selectedMusic atIndex:0];
        }
    }
    
    [AppDelegate setstaticMusicHistoryListMutableArray:tempMusicHistoryListMutableArray];
    [self.registerViewController.historyListViewController.musicHistoryListTableView reloadData];
    //
    NSRect showFrame=NSMakeRect(179, 47.5, 846, 468);
    self.musicDetailViewController=[[MusicDetailViewController alloc]initWithNibName:@"MusicDetailViewController" bundle:nil];
    self.musicDetailView=self.musicDetailViewController.view;
    [self.musicDetailView setFrame:showFrame];
    [self.mainView setHidden:YES];
    [self.movieView setHidden:YES];
    [self.musicView setHidden:YES];
    [self.window.contentView addSubview:self.musicDetailView];

}

- (void)awakeFromNib
{
    // add the searchMenu to this control, allowing recent searches to be added.
    //
    // note that we could build this menu inside our nib, but for clarity we're
    // building the menu in code to illustrate the use of tags:
    //		NSSearchFieldRecentsTitleMenuItemTag, NSSearchFieldNoRecentsMenuItemTag, etc.

    if ([self.searchField respondsToSelector:@selector(setRecentSearches:)])
    {
        NSMenu *searchMenu = [[NSMenu alloc] initWithTitle:@"Search Menu"];
        [searchMenu setAutoenablesItems:YES];
        
        // first add our custom menu item (Important note: "action" MUST be valid or the menu item is disabled)
        NSMenuItem *item = [[NSMenuItem alloc] initWithTitle:@"Custom" action:nil keyEquivalent:@""];
        [item setTarget: self];
        [searchMenu insertItem:item atIndex:0];
        
        // add our own separator to keep our custom menu separate
        NSMenuItem *separator =  [NSMenuItem separatorItem];
        [searchMenu insertItem:separator atIndex:1];
        
        NSMenuItem *recentsTitleItem = [[NSMenuItem alloc] initWithTitle:@"Recent Searches" action:nil keyEquivalent:@""];
        // tag this menu item so NSSearchField can use it and respond to it appropriately
        [recentsTitleItem setTag:NSSearchFieldRecentsTitleMenuItemTag];
        [searchMenu insertItem:recentsTitleItem atIndex:2];
        
        NSMenuItem *norecentsTitleItem = [[NSMenuItem alloc] initWithTitle:@"No recent searches" action:nil keyEquivalent:@""];
        // tag this menu item so NSSearchField can use it and respond to it appropriately
        [norecentsTitleItem setTag:NSSearchFieldNoRecentsMenuItemTag];
        [searchMenu insertItem:norecentsTitleItem atIndex:3];
        
        NSMenuItem *recentsItem = [[NSMenuItem alloc] initWithTitle:@"Recents" action:nil keyEquivalent:@""];
        // tag this menu item so NSSearchField can use it and respond to it appropriately
        [recentsItem setTag:NSSearchFieldRecentsMenuItemTag];
        [searchMenu insertItem:recentsItem atIndex:4];
        
        NSMenuItem *separatorItem = (NSMenuItem*)[NSMenuItem separatorItem];
        // tag this menu item so NSSearchField can use it, by hiding/show it appropriately:
        [separatorItem setTag:NSSearchFieldRecentsTitleMenuItemTag];
        [searchMenu insertItem:separatorItem atIndex:5];
        
        NSMenuItem *clearItem = [[NSMenuItem alloc] initWithTitle:@"Clear" action:nil keyEquivalent:@""];
        [clearItem setTag:NSSearchFieldClearRecentsMenuItemTag];	// tag this menu item so NSSearchField can use it
        [searchMenu insertItem:clearItem atIndex:6];
        
        id searchCell = [self.searchField cell];
        [searchCell setMaximumRecents:20];
        [searchCell setSearchMenuTemplate:searchMenu];
    }
}

-(IBAction)clickSearchField:(id)sender{
    self.searchResultView=self.searchResultViewController.view;
    [self.searchResultView setHidden:NO];
    NSString *searchFieldString=self.searchField.stringValue;
    NSMutableArray *tempMovieArray=[AppDelegate getStaticMovieMutableArray];
    NSInteger y=[tempMovieArray count];
    Movie *tempMovie=[[Movie alloc]init];
    for (NSInteger i=0; i<y; i++) {
        if ([[[tempMovieArray objectAtIndex:i] valueForKey:@"name"] isEqualTo:searchFieldString]){
            tempMovie=[tempMovieArray objectAtIndex:i];
            [AppDelegate setStaticMovie:tempMovie];
            NSRect showFrame=NSMakeRect(179, 47.5, 846, 468);
            [self.searchResultView setFrame:showFrame];
            [self.mainView setHidden:YES];
            [self.movieView setHidden:YES];
            [self.musicView setHidden:YES];
            [self.registerViewController.registerView setHidden:YES];
            [self.registerViewController.modifyView setHidden:YES];
            [self.registerViewController.favoriteView setHidden:YES];
            [self.registerViewController.historyView setHidden:YES];
            [self.window.contentView addSubview:self.searchResultView];
            [self.searchResultViewController.searchResultTableView reloadData];
            }
            }
}
@end
