//
//  FavoriteListViewController.m
//  MyMoment
//
//  Created by Edward Liu on 16/4/24.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import "FavoriteListViewController.h"
#import "AppDelegate.h"
@interface FavoriteListViewController ()

@end

@implementation FavoriteListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
}


-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return [[AppDelegate getStaticFavoriteListMutableArray] count];
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
  
    if ([tableColumn.identifier isEqualTo:@"heart"]) {
        NSImageView *heartImageView=[tableView makeViewWithIdentifier:@"heart" owner:self];
        return heartImageView;
    }
    
    if ([tableColumn.identifier isEqualTo:@"name"]) {
        NSTextField *nameLabel=[tableView makeViewWithIdentifier:@"name" owner:self];
        nameLabel.stringValue=[[[AppDelegate getStaticFavoriteListMutableArray] objectAtIndex:row] valueForKey:@"name"];
        return nameLabel;
        
    }
    if ([tableColumn.identifier isEqualTo:@"delete"]) {
       NSButton *deleteBtn=[tableView makeViewWithIdentifier:@"delete" owner:self];
      //  [deleteBtn setAction:@selector(action:)];
       // [deleteBtn setIdentifier: [NSString stringWithFormat:@"%ld",(long)row]];
        return deleteBtn;
    }
    if ([tableColumn.identifier isEqualTo:@"types"]) {
        NSTextField *typesLabel=[tableView makeViewWithIdentifier:@"types" owner:self];
        typesLabel.stringValue=[[[AppDelegate getStaticFavoriteListMutableArray] objectAtIndex:row] valueForKey:@"types"];
        return typesLabel;
    }
    if ([tableColumn.identifier isEqualTo:@"author"]) {
        NSTextField *authorLabel=[tableView makeViewWithIdentifier:@"author" owner:self];
        authorLabel.stringValue=[[[AppDelegate getStaticFavoriteListMutableArray] objectAtIndex:row] valueForKey:@"author"];
        return authorLabel;
    }
    if ([tableColumn.identifier isEqualTo:@"score"]) {
        NSTextField *scoreLabel=[tableView makeViewWithIdentifier:@"score" owner:self];
        scoreLabel.stringValue=[[[AppDelegate getStaticFavoriteListMutableArray] objectAtIndex:row] valueForKey:@"score"];
        return scoreLabel;
    }
    return nil;
}

-(IBAction)clickDeletBtn:(id)sender{
    NSInteger selected = [self.favoriteListTableView rowForView:sender];
    NSMutableArray *tempFavoriteListMutableArray=[AppDelegate getStaticFavoriteListMutableArray];
    [tempFavoriteListMutableArray removeObjectAtIndex:selected];
    [AppDelegate setstaticFavoriteListMutableArray:tempFavoriteListMutableArray];
    //[[AppDelegate getStaticFavoriteListMutableArray] removeObjectAtIndex:selected];
    [self.favoriteListTableView reloadData];
}



@end
