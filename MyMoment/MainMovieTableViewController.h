//
//  MainMovieTableViewController.h
//  MyMoment
//
//  Created by Edward Liu on 16/4/17.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface MainMovieTableViewController : NSObject<NSTableViewDelegate,NSTableViewDataSource>
@property IBOutlet NSTableView *mainMovieTableView;
@end
