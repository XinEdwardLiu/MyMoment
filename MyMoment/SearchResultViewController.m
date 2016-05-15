//
//  SearchResultViewController.m
//  MyMoment
//
//  Created by Edward Liu on 16/5/8.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import "SearchResultViewController.h"
#import "AppDelegate.h"
@interface SearchResultViewController ()

@end

@implementation SearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    [self.searchResultTableView reloadData];
}


-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return 1;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    if ([AppDelegate getStaticMovie]==nil) {
        if ([tableColumn.identifier isEqualTo:@"name"]) {
            NSTextField *nameLabel=[tableView makeViewWithIdentifier:@"name" owner:self];
            nameLabel.stringValue=@"";
            return nameLabel;
        }
        if ([tableColumn.identifier isEqualTo:@"types"]) {
            NSTextField *typesLabel=[tableView makeViewWithIdentifier:@"types" owner:self];
            typesLabel.stringValue=@"";
            return typesLabel;
        }
        if ([tableColumn.identifier isEqualTo:@"author"]) {
            NSTextField *authorLabel=[tableView makeViewWithIdentifier:@"author" owner:self];
            authorLabel.stringValue=@"";
            return authorLabel;
        }
        if ([tableColumn.identifier isEqualTo:@"score"]) {
            NSTextField *scoreLabel=[tableView makeViewWithIdentifier:@"score" owner:self];
            scoreLabel.stringValue=@"";
            return scoreLabel;
        }
    }
    else{
        
        
        if ([tableColumn.identifier isEqualTo:@"name"]) {
            NSTextField *nameLabel=[tableView makeViewWithIdentifier:@"name" owner:self];
            nameLabel.stringValue=[[AppDelegate getStaticMovie]valueForKey:@"name"];
            return nameLabel;
        }
        if ([tableColumn.identifier isEqualTo:@"types"]) {
            NSTextField *typesLabel=[tableView makeViewWithIdentifier:@"types" owner:self];
            typesLabel.stringValue=[[AppDelegate getStaticMovie]valueForKey:@"types"];
            return typesLabel;
        }
        if ([tableColumn.identifier isEqualTo:@"author"]) {
            NSTextField *authorLabel=[tableView makeViewWithIdentifier:@"author" owner:self];
            authorLabel.stringValue=[[AppDelegate getStaticMovie]valueForKey:@"author"];
            return authorLabel;
        }
        if ([tableColumn.identifier isEqualTo:@"score"]) {
            NSTextField *scoreLabel=[tableView makeViewWithIdentifier:@"score" owner:self];
            scoreLabel.stringValue=[[AppDelegate getStaticMovie]valueForKey:@"score"];
            return scoreLabel;
        }

    
    }
        return nil;
}
@end
