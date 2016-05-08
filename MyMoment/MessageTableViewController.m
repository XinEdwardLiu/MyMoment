//
//  MessageTableViewController.m
//  MyMoment
//
//  Created by Edward Liu on 16/5/7.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import "MessageTableViewController.h"
#import "Movie.h"
#import "AppDelegate.h"
@implementation MessageTableViewController

-(NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
   return  [[[AppDelegate getStaticMovie] valueForKey:@"commentMutableArray"] count];
}


-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    return [[[[AppDelegate getStaticMovie] valueForKey:@"commentMutableArray"] objectAtIndex:row] valueForKey:tableColumn.identifier];
    
}


@end
