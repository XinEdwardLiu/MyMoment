//
//  MusicFavoriteListTableViewController.m
//  MyMoment
//
//  Created by Edward Liu on 16/5/13.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import "MusicFavoriteListTableViewController.h"
#import "AppDelegate.h"
@implementation MusicFavoriteListTableViewController
-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return [[AppDelegate getStaticMusicFavoriteListMutableArray] count];
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn*)tableColumn row:(NSInteger)row{
    if ([tableColumn.identifier isEqualTo:@"heart"]) {
        NSImageView *heartImageView=[tableView makeViewWithIdentifier:@"heart" owner:self];
        return heartImageView;
    }
    
    if ([tableColumn.identifier isEqualTo:@"name"]) {
        NSTextField *nameLabel=[tableView makeViewWithIdentifier:@"name" owner:self];
        nameLabel.stringValue=[[[AppDelegate getStaticMusicFavoriteListMutableArray] objectAtIndex:row] valueForKey:@"name"];
        return nameLabel;
        
    }
    if ([tableColumn.identifier isEqualTo:@"delete"]) {
        NSButton *deleteBtn=[tableView makeViewWithIdentifier:@"delete" owner:self];
        [deleteBtn setAction:@selector(action:)];
        [deleteBtn setIdentifier: [NSString stringWithFormat:@"%ld",(long)row]];
        return deleteBtn;
    }
    if ([tableColumn.identifier isEqualTo:@"types"]) {
        NSTextField *typesLabel=[tableView makeViewWithIdentifier:@"types" owner:self];
        typesLabel.stringValue=[[[AppDelegate getStaticMusicFavoriteListMutableArray] objectAtIndex:row] valueForKey:@"types"];
        return typesLabel;
    }
    if ([tableColumn.identifier isEqualTo:@"author"]) {
        NSTextField *authorLabel=[tableView makeViewWithIdentifier:@"author" owner:self];
        authorLabel.stringValue=[[[AppDelegate getStaticMusicFavoriteListMutableArray] objectAtIndex:row] valueForKey:@"author"];
        return authorLabel;
    }
    if ([tableColumn.identifier isEqualTo:@"score"]) {
        NSTextField *scoreLabel=[tableView makeViewWithIdentifier:@"score" owner:self];
        scoreLabel.stringValue=[[[AppDelegate getStaticMusicFavoriteListMutableArray] objectAtIndex:row] valueForKey:@"score"];
        return scoreLabel;
    }
    return nil;

}

-(IBAction)action:(NSButton *)sender{
    NSButton *deleteBtn=sender;
    NSInteger row=[deleteBtn.identifier intValue];
    NSMutableArray *tempMusicFavoriteListMutableArray=[AppDelegate getStaticMusicFavoriteListMutableArray];
    [tempMusicFavoriteListMutableArray removeObjectAtIndex:row];
    [AppDelegate setstaticMusicFavoriteListMutableArray:tempMusicFavoriteListMutableArray];
    AppDelegate *appdelegate=[NSApp delegate];
    [appdelegate.mainWindowController.registerViewController.favoriteListViewController.musicFavoriteListTableView reloadData];
}


@end
