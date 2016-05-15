//
//  SearchResultViewController.h
//  MyMoment
//
//  Created by Edward Liu on 16/5/8.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SearchResultViewController : NSViewController<NSTableViewDelegate,NSTableViewDataSource>
@property IBOutlet NSTableView *searchResultTableView;
@property IBOutlet NSTextField *nullLabel;
@end
