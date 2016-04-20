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
    
}

-(IBAction)clickMovieBtn:(id)sender{
NSRect showFrame=NSMakeRect(179, 47.5, 846, 468);
   
    [self.movieView setFrame:showFrame];
    [self.mainView setHidden:YES];
    [self.movieView setHidden:NO];
    [self.window.contentView addSubview:self.movieView];
    [self.movieDetailView setHidden:YES];
    [self.musicView setHidden:YES];
}

-(IBAction)clickMusicBtn:(id)sender{
NSRect showFrame=NSMakeRect(179, 47.5, 846, 468);
    [self.musicView setFrame:showFrame];
    [self.mainView setHidden:YES];
    [self.movieView setHidden:YES];
    [self.movieDetailView setHidden:YES];
    [self.musicView setHidden:NO];
    [self.window.contentView addSubview:self.musicView];


}


-(IBAction)clickMovieImageBtn:(id)sender{
NSRect showFrame=NSMakeRect(179, 47.5, 846, 468);
    self.movieDetailViewController=[[MovieDetailViewController alloc]initWithNibName:@"MovieDetailViewController" bundle:nil];
    self.movieDetailView=self.movieDetailViewController.view;
    [self.movieDetailView setFrame:showFrame];
    [self.movieView setHidden:YES];
    [self.window.contentView addSubview:self.movieDetailView];

}



//




@end
