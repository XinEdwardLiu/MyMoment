//
//  RigisterViewController.h
//  MyMoment
//
//  Created by Edward Liu on 16/3/21.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RegisterInfoViewController.h"
#import "FavoriteListViewController.h"
#import "HistoryListViewController.h"
@interface RigisterViewController : NSViewController
@property IBOutlet NSTextField *accountTextField;
@property IBOutlet NSTextField *passwordTextField;
@property IBOutlet NSTextField *nameLabel;
@property IBOutlet NSButton *aboardBtn;
@property IBOutlet NSButton *registerBtn;
@property IBOutlet NSButton *favoriteListBtn;
@property IBOutlet NSButton *historyListBtn;
@property NSView *registerView;
@property NSView *modifyView;
@property NSView *favoriteView;
@property NSView *historyView;

@property IBOutlet NSTextField *attentionLabel;
@property IBOutlet NSButton *quitBtn;

@property (strong) IBOutlet RegisterInfoViewController *registerInfoViewController;
@property (strong) IBOutlet FavoriteListViewController *favoriteListViewController;
@property (strong) IBOutlet HistoryListViewController *historyListViewController;


@end
