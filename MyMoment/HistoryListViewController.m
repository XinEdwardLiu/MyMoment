//
//  HistoryListViewController.m
//  MyMoment
//
//  Created by Edward Liu on 16/4/24.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import "HistoryListViewController.h"
#import "AppDelegate.h"
#import "MovieDetailViewController.h"
#import "Movie.h"

@interface HistoryListViewController ()

@end

@implementation HistoryListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}


-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return [[AppDelegate getStaticHistoryListMutableArray] count];
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    if ([tableColumn.identifier isEqualTo:@"name"]) {
        NSTextField *nameLabel=[tableView makeViewWithIdentifier:@"name" owner:self];
        nameLabel.stringValue=[[[AppDelegate getStaticHistoryListMutableArray] objectAtIndex:row] valueForKey:@"name"];
        return nameLabel;

    }
    
    if ([tableColumn.identifier isEqualTo:@"types"]) {
        NSTextField *typesLabel=[tableView makeViewWithIdentifier:@"types" owner:self];
        typesLabel.stringValue=[[[AppDelegate getStaticHistoryListMutableArray] objectAtIndex:row] valueForKey:@"types"];
        return typesLabel;

    }
    if ([tableColumn.identifier isEqualTo:@"author"]) {
        NSTextField *authorLabel=[tableView makeViewWithIdentifier:@"author" owner:self];
        authorLabel.stringValue=[[[AppDelegate getStaticHistoryListMutableArray] objectAtIndex:row] valueForKey:@"author"];
        return authorLabel;

    }
    if ([tableColumn.identifier isEqualTo:@"score"]) {
        NSTextField *scoreLabel=[tableView makeViewWithIdentifier:@"score" owner:self];
        scoreLabel.stringValue=[[[AppDelegate getStaticHistoryListMutableArray] objectAtIndex:row] valueForKey:@"score"];
        return scoreLabel;
    }
    if ([tableColumn.identifier isEqualTo:@"number"]) {
        NSTextField *numberLabel=[tableView makeViewWithIdentifier:@"number" owner:self];
        numberLabel.stringValue=[NSNumber numberWithInteger:row+1];
        return numberLabel;
    }

    return nil;
}

-(IBAction)clickHistoryListTableView:(id)sender{
    Movie *tempMovie=[[AppDelegate getStaticHistoryListMutableArray]objectAtIndex:self.historyListTableView.selectedRow];
    [AppDelegate setStaticMovie:tempMovie];
    AppDelegate *appdelegate=[NSApp delegate];
    NSRect showFrame=NSMakeRect(179, 47.5, 846, 468);
    appdelegate.mainWindowController.movieDetailViewController=[[MovieDetailViewController alloc]initWithNibName:@"MovieDetailViewController" bundle:nil];
    appdelegate.mainWindowController.movieDetailView=appdelegate.mainWindowController.movieDetailViewController.view;
    [appdelegate.mainWindowController.movieDetailView setFrame:showFrame];
    [self.view setHidden:YES];
    [appdelegate.mainWindowController.window.contentView addSubview:appdelegate.mainWindowController.movieDetailView];
    
    



}

@end
