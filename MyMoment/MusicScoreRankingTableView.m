//
//  MusicScoreRankingTableView.m
//  MyMoment
//
//  Created by Edward Liu on 16/4/22.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import "MusicScoreRankingTableView.h"

@implementation MusicScoreRankingTableView
-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    
    return [[AppDelegate getStaticMusicMutableArray] count];
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    
    NSString *columnIdentifier=[tableColumn identifier];
    
    NSMutableArray *mainMusicMutableArray=[AppDelegate getStaticMusicMutableArray];
    
    NSSortDescriptor *scoreDescriptor = [[NSSortDescriptor alloc] initWithKey:@"score" ascending:NO];
    NSArray *sortDescriptors = @[scoreDescriptor];
    NSArray *sortedArray = [mainMusicMutableArray sortedArrayUsingDescriptors:sortDescriptors];
    
    
    if ([columnIdentifier isEqualToString:@"name"]) {
        
        NSTextField *nameLabel=[tableView makeViewWithIdentifier:@"name" owner:self];
        nameLabel.stringValue=[[sortedArray objectAtIndex:row] valueForKey:@"name"];
        return nameLabel;
    }
    
    else if([columnIdentifier isEqualToString:@"author"])
    {
        NSTextField *authorLabel=[tableView makeViewWithIdentifier:@"author" owner:self];
        authorLabel.stringValue=[[sortedArray objectAtIndex:row] valueForKey:@"author"];
        return authorLabel;
    }
    else if([columnIdentifier isEqualToString:@"score"])
    {
        NSTextField *scoreLabel=[tableView makeViewWithIdentifier:@"score" owner:self];
        scoreLabel.stringValue=[[sortedArray objectAtIndex:row] valueForKey:@"score"];
        return scoreLabel;
    }
    
    return nil;
    
}


@end
