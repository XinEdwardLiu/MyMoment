//
//  FavoriteListViewController.h
//  MyMoment
//
//  Created by Edward Liu on 16/4/24.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FavoriteListViewController : NSViewController<NSTableViewDataSource,NSTableViewDelegate>

@property IBOutlet NSTableView *favoriteListTableView;

@end
