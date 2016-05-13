//
//  MainWindowController.h
//  MyMoment
//
//  Created by Edward Liu on 16/3/16.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MovieDetailViewController.h"
#import "RigisterViewController.h"
#import "SearchResultViewController.h"


@interface MainWindowController : NSWindowController<NSWindowDelegate>
@property IBOutlet NSTabView *mainTab;
@property NSView *mainView;
@property NSView *movieView;
@property NSView *musicView;
@property NSView *movieDetailView;
@property(strong)IBOutlet MovieDetailViewController *movieDetailViewController;
@property (strong)IBOutlet RigisterViewController *registerViewController;
@property IBOutlet NSButton *mainBtn;
@property IBOutlet NSButton *movieBtn;
@property IBOutlet NSButton *musicBtn;

@property IBOutlet NSTableView *mainMovieTableView;
@property IBOutlet NSTableView *mainMusicTableView;
@property IBOutlet NSScrollView *mainMovieScrollView;
@property IBOutlet NSButton *mainMovieBtn;
@property IBOutlet NSButton *mainMusicBtn;


@property IBOutlet NSTableView *movieAllTableView;
@property IBOutlet NSTableView *movieScoreRankingTableView;
@property IBOutlet NSButton *movieImageBtn;
@property IBOutlet NSScrollView *movieScrollView;

@property IBOutlet NSTableView *musicAllTableView;
@property IBOutlet NSTableView *musicScoreRankingTableView;
@property IBOutlet NSButton *musicImageBtn;
@property IBOutlet NSScrollView *musicScrollView;

@property IBOutlet NSSearchField *searchField;
@property (strong)IBOutlet SearchResultViewController *searchResultViewController;
@property NSView *searchResultView;

@end
