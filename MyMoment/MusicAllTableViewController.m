//
//  MusicAllTableViewController.m
//  MyMoment
//
//  Created by Edward Liu on 16/4/22.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import "MusicAllTableViewController.h"

@implementation MusicAllTableViewController
-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return [[AppDelegate getStaticMusicMutableArray] count];
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    
    for (NSInteger y=0; y<[[AppDelegate getStaticMusicMutableArray] count]; y++)
    {
        
        if ([[tableColumn identifier] isEqualToString:@"name"]) {
            
            NSTextField *nameLabel=[tableView makeViewWithIdentifier:@"name" owner:self];
            nameLabel.stringValue=[[[AppDelegate getStaticMusicMutableArray]  objectAtIndex:row] valueForKey:@"name"];
            return nameLabel;
        }
        
        else if([[tableColumn identifier] isEqualToString:@"author"])
        {
            NSTextField *authorLabel=[tableView makeViewWithIdentifier:@"author" owner:self];
            authorLabel.stringValue=[[[AppDelegate getStaticMusicMutableArray] objectAtIndex:row] valueForKey:@"author"];
            return authorLabel;
        }
    }
    return nil;
}

@end
