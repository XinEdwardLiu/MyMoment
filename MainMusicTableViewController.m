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
   // return [[AppDelegate getStaticMusicMutableArray] count];
}

-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
return [[[AppDelegate getStaticMusicMutableArray] objectAtIndex:row] valueForKey:[tableColumn identifier]];
}

@end
