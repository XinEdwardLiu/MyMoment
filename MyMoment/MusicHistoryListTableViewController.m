//
//  MusicHistoryListTableViewController.m
//  MyMoment
//
//  Created by Edward Liu on 16/5/13.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import "MusicHistoryListTableViewController.h"
#import "AppDelegate.h"

@implementation MusicHistoryListTableViewController
-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return [[AppDelegate getStaticMusicHistoryListMutableArray] count];
}
-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn*)tableColumn row:(NSInteger)row{
    if ([tableColumn.identifier isEqualTo:@"name"]) {
        NSTextField *nameLabel=[tableView makeViewWithIdentifier:@"name" owner:self];
        nameLabel.stringValue=[[[AppDelegate getStaticMusicHistoryListMutableArray] objectAtIndex:row] valueForKey:@"name"];
        return nameLabel;
        
    }
    
    if ([tableColumn.identifier isEqualTo:@"types"]) {
        NSTextField *typesLabel=[tableView makeViewWithIdentifier:@"types" owner:self];
        typesLabel.stringValue=[[[AppDelegate getStaticMusicHistoryListMutableArray] objectAtIndex:row] valueForKey:@"types"];
        return typesLabel;
        
    }
    if ([tableColumn.identifier isEqualTo:@"author"]) {
        NSTextField *authorLabel=[tableView makeViewWithIdentifier:@"author" owner:self];
        authorLabel.stringValue=[[[AppDelegate getStaticMusicHistoryListMutableArray] objectAtIndex:row] valueForKey:@"author"];
        return authorLabel;
        
    }
    if ([tableColumn.identifier isEqualTo:@"score"]) {
        NSTextField *scoreLabel=[tableView makeViewWithIdentifier:@"score" owner:self];
        scoreLabel.stringValue=[[[AppDelegate getStaticMusicHistoryListMutableArray] objectAtIndex:row] valueForKey:@"score"];
        return scoreLabel;
    }
    if ([tableColumn.identifier isEqualTo:@"number"]) {
        NSTextField *numberLabel=[tableView makeViewWithIdentifier:@"number" owner:self];
        numberLabel.stringValue=[[NSNumber numberWithInteger:row+1] stringValue];
        return numberLabel;
    }
    
    return nil;

}
@end
