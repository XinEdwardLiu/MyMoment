//
//  HistoryListViewController.h
//  MyMoment
//
//  Created by Edward Liu on 16/4/24.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface HistoryListViewController : NSViewController<NSTableViewDelegate,NSTableViewDataSource>
@property IBOutlet NSTableView *historyListTableView;
@property IBOutlet NSTableView *musicHistoryListTableView;
@end
