//
//  MovieAllTableViewController.m
//  MyMoment
//
//  Created by Edward Liu on 16/4/22.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import "MovieAllTableViewController.h"

@implementation MovieAllTableViewController

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{

    return [[AppDelegate getStaticMovieMutableArray] count];
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{

    NSString *columnIdentifier=[tableColumn identifier];
    NSMutableArray *mainMovieMutableArray=[AppDelegate getStaticMovieMutableArray];

        
        if ([columnIdentifier isEqualToString:@"name"]) {
            
            NSTextField *nameLabel=[tableView makeViewWithIdentifier:@"name" owner:self];
            nameLabel.stringValue=[[mainMovieMutableArray objectAtIndex:row] valueForKey:@"name"];
            return nameLabel;
            }
        
        else if([columnIdentifier isEqualToString:@"author"])
        {
            NSTextField *authorLabel=[tableView makeViewWithIdentifier:@"author" owner:self];
            authorLabel.stringValue=[[mainMovieMutableArray objectAtIndex:row] valueForKey:@"author"];
            return authorLabel;
        }
  
    return nil;


}

@end
