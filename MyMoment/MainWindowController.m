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



-(IBAction)clickMovieTableView:(id)sender{
    NSLog(@"%ld",self.mainMovieTableView.selectedRow);
    NSInteger row=self.mainMovieTableView.selectedRow;
    NSMutableArray *mainMovieMutableArry=[AppDelegate getStaticMovieMutableArray];
    
    
    NSRect showFrame=NSMakeRect(179, 47.5, 846, 468);
    self.movieDetailViewController=[[MovieDetailViewController alloc]initWithNibName:@"MovieDetailViewController" bundle:nil];
    self.movieDetailView=self.movieDetailViewController.view;
    [self.movieDetailView setFrame:showFrame];
    [self.mainView setHidden:YES];
    self.movieDetailViewController.nameLabel.stringValue=[[mainMovieMutableArry objectAtIndex:row] valueForKey:@"name"];
    self.movieDetailViewController.styleLabel.stringValue=[[mainMovieMutableArry objectAtIndex:row] valueForKey:@"types"];
    self.movieDetailViewController.authorLabel.stringValue=[[mainMovieMutableArry objectAtIndex:row] valueForKey:@"author"];
    self.movieDetailViewController.introductionLabel.stringValue=[[mainMovieMutableArry objectAtIndex:row] valueForKey:@"introduction"];
    self.movieDetailViewController.resultScoreLabel.stringValue=[[mainMovieMutableArry objectAtIndex:row] valueForKey:@"score"];
    float score=[[[mainMovieMutableArry objectAtIndex:row] valueForKey:@"score"] floatValue];
    
    NSImage *scoreStarImage;
    
    if (score==5.0) {
        scoreStarImage=[NSImage imageNamed:@"5star"];
    }
    else if(score==4.0){
        scoreStarImage=[NSImage imageNamed:@"4star"];
    }
    else if(score==3.0){
        scoreStarImage=[NSImage imageNamed:@"3star"];
    }
    else if(score==2.0){
        scoreStarImage=[NSImage imageNamed:@"2star"];
    }
    else if(score==1.0){
        scoreStarImage=[NSImage imageNamed:@"1star"];
    }
        [self.movieDetailViewController.resultStarImageView setImage:scoreStarImage];
    NSMutableArray *messageMutableArray=[[NSMutableArray alloc]init];
    messageMutableArray=[[mainMovieMutableArry objectAtIndex:row] valueForKey:@"commentMutableArray"];
    NSLog(@"%@",[messageMutableArray objectAtIndex:0]);
    [self.window.contentView addSubview:self.movieDetailView];
    
}




@end
