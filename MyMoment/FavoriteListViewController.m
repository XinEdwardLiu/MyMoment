//
//  FavoriteListViewController.m
//  MyMoment
//
//  Created by Edward Liu on 16/4/24.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import "FavoriteListViewController.h"

@interface FavoriteListViewController ()

@end

@implementation FavoriteListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}


-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return 10;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
  
    if ([tableColumn.identifier isEqualTo:@"heart"]) {
        NSImageView *heartImageView=[tableView makeViewWithIdentifier:@"heart" owner:self];
        return heartImageView;
    }
    
    if ([tableColumn.identifier isEqualTo:@"name"]) {
        NSTextField *nameLabel=[tableView makeViewWithIdentifier:@"name" owner:self];
        nameLabel.stringValue=@"test";
        return nameLabel;
        
    }
    if ([tableColumn.identifier isEqualTo:@"delete"]) {
        NSButton *deleteBtn=[tableView makeViewWithIdentifier:@"delete" owner:self];
        [deleteBtn setAction:@selector(action:)];
        
    }
    return nil;
}

@end
