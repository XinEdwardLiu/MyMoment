//
//  RigisterViewController.m
//  MyMoment
//
//  Created by Edward Liu on 16/3/21.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import "RigisterViewController.h"
#import "RegisterInfoViewController.h"
#import "AppDelegate.h"
@interface RigisterViewController ()
@property (strong) IBOutlet RegisterInfoViewController *registerInfoViewController;
@end

@implementation RigisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    [self.view setWantsLayer:YES];
    self.view.layer.backgroundColor=[NSColor grayColor].CGColor;
    [self.favoriteListBtn setHidden:YES];
    [self.historyListBtn setHidden:YES];
}


-(IBAction)clickRegisterBtn:(id)sender{

    
    self.registerInfoViewController=[[RegisterInfoViewController alloc]initWithNibName:@"RegisterInfoViewController" bundle:nil];
    NSRect rigsterFrame=NSMakeRect(179, 47.5, 846, 468);
     [self.registerInfoViewController.view setFrame:rigsterFrame];
   // [self.view.superview addSubview:self.registerInfoViewController.view];
    
    AppDelegate *appdelegate=[NSApp delegate];
    
    [appdelegate.mainWindowController.mainView setHidden:YES];
    [appdelegate.mainWindowController.musicView setHidden:YES];
    [appdelegate.mainWindowController.movieView setHidden:YES];
    [appdelegate.mainWindowController.movieDetailViewController.view setHidden:YES];
[appdelegate.mainWindowController.window.contentView addSubview:self.registerInfoViewController.view];

}

-(IBAction)clickAboardBtn:(id)sender{

    if ([self.accountTextField.stringValue isEqualToString:@"Edward"]&[self.passwordTextField.stringValue isEqualToString:@"1234"]) {
        [self.accountTextField setHidden:YES];
        [self.passwordTextField setHidden:YES];
        [self.aboardBtn setHidden:YES];
        [self.registerBtn setHidden:YES];
        self.nameLabel.stringValue=@"Edward";
        [self.favoriteListBtn setHidden:NO];
        [self.historyListBtn setHidden:NO];
        [self.attentionLabel setHidden:YES];
        BOOL accountState=YES;
        [AppDelegate setStaticAcccountState:accountState];
    }

    else{
        self.attentionLabel.stringValue=@"Invalid Input!";
        return;
    
    
    }
    
    

}

@end
