//
//  MainMusicTableViewController.m
//  MyMoment
//
//  Created by Edward Liu on 16/4/17.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import "MainMusicTableViewController.h"
#import "AppDelegate.h"
@implementation MainMusicTableViewController

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return 10;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    
    NSString *columnIdentifier=[tableColumn identifier];
    NSMutableArray *mainMusicMutableArray=[AppDelegate getStaticMusicMutableArray];
    
    for (NSInteger y=0; y<10; y++)
    {
        
        if ([columnIdentifier isEqualToString:@"name"]) {
            
            NSTextField *nameLabel=[tableView makeViewWithIdentifier:@"name" owner:self];
            nameLabel.stringValue=[[mainMusicMutableArray objectAtIndex:row] valueForKey:@"name"];
            return nameLabel;
        }
        
        else if([columnIdentifier isEqualToString:@"author"])
        {
            NSTextField *authorLabel=[tableView makeViewWithIdentifier:@"author" owner:self];
            authorLabel.stringValue=[[mainMusicMutableArray objectAtIndex:row] valueForKey:@"author"];
            return authorLabel;
        }
    }
    return nil;
}


-(IBAction)clickMusicTableView:(id)sender{
    NSLog(@"%ld",self.mainMusicTableView.selectedRow);
    
}

@end
