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

@end

@implementation RigisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    [self.view setWantsLayer:YES];
    self.view.layer.backgroundColor=[NSColor grayColor].CGColor;
    [self.favoriteListBtn setHidden:YES];
    [self.historyListBtn setHidden:YES];
    [self.quitBtn setHidden:YES];
   // self.registerInfoViewController=[[RegisterInfoViewController alloc]initWithNibName:@"RegisterInfoViewController" bundle:nil];

}

-(IBAction)clickQuitBtn:(id)sender{
    [self.accountTextField setHidden:NO];
    [self.passwordTextField setHidden:NO];
    [self.aboardBtn setHidden:NO];
    [self.registerBtn setHidden:NO];
    [self.favoriteListBtn setHidden:YES];
    [self.historyListBtn setHidden:YES];
    [self.attentionLabel setHidden:NO];
    [self.quitBtn setHidden:YES];
    self.nameLabel.stringValue=@"";
    self.attentionLabel.stringValue=@"";
    self.accountTextField.stringValue=@"";
    self.passwordTextField.stringValue=@"";
    [self.modifyView setHidden:YES];
    BOOL accountState=NO;
    [AppDelegate setStaticAcccountState:accountState];

}

-(IBAction)clickRegisterBtn:(id)sender{

    self.registerInfoViewController=[[RegisterInfoViewController alloc]initWithNibName:@"RegisterInfoViewController" bundle:nil];
    self.registerView=self.registerInfoViewController.view;
    NSRect rigsterFrame=NSMakeRect(179, 47.5, 846, 468);
     [self.registerView setFrame:rigsterFrame];
   // [self.view.superview addSubview:self.registerInfoViewController.view];
    
    AppDelegate *appdelegate=[NSApp delegate];
    
    [appdelegate.mainWindowController.mainView setHidden:YES];
    [appdelegate.mainWindowController.musicView setHidden:YES];
    [appdelegate.mainWindowController.movieView setHidden:YES];
    [appdelegate.mainWindowController.movieDetailViewController.view setHidden:YES];
[appdelegate.mainWindowController.window.contentView addSubview:self.registerView];
    
    
}

-(IBAction)clickAboardBtn:(id)sender{

    NSMutableArray *uerMutableArray=[AppDelegate getStaticUserMutableArray];
    
    for (NSInteger y=0; y<[uerMutableArray count]; y++) {
        
        User *temperUser=[uerMutableArray objectAtIndex:y];
        
        if ([self.accountTextField.stringValue isEqualTo:temperUser.userName] & [self.passwordTextField.stringValue isEqualToString:temperUser.userPassword]) {
            [self.accountTextField setHidden:YES];
            [self.passwordTextField setHidden:YES];
            [self.aboardBtn setHidden:YES];
            [self.registerBtn setHidden:YES];
            self.nameLabel.stringValue=temperUser.userName;
            [self.favoriteListBtn setHidden:NO];
            [self.historyListBtn setHidden:NO];
            [self.attentionLabel setHidden:YES];
            [self.quitBtn setHidden:NO];
            BOOL accountState=YES;
            [AppDelegate setStaticAcccountState:accountState];
            [AppDelegate setStaticUser:temperUser];
            [AppDelegate setStaticUserRow:y];
        }
        else{
            self.attentionLabel.stringValue=@"Invalid Input!";
    }
    
    }

}

-(IBAction)clickAccountImageBtn:(id)sender{
    
    if ([AppDelegate getStaticAccountState]==NO) {
        return;
    }
    else if([AppDelegate getStaticAccountState]==YES){
    self.registerInfoViewController=[[RegisterInfoViewController alloc]initWithNibName:@"RegisterInfoViewController" bundle:nil];
    self.modifyView=self.registerInfoViewController.view;
    NSRect rigsterFrame=NSMakeRect(179, 47.5, 846, 468);
    [self.modifyView setFrame:rigsterFrame];
        self.registerInfoViewController.accountTextField.stringValue=[AppDelegate getStaticUser].userName;
        self.registerInfoViewController.ageTextField.stringValue=[AppDelegate getStaticUser].userAge;
        if ([[AppDelegate getStaticUser].userSex isEqualTo:@"男"]) {
            [self.registerInfoViewController.sexMatrix selectCellWithTag:1];
        }
        else{
            [self.registerInfoViewController.sexMatrix selectCellWithTag:2];}
        self.registerInfoViewController.emailTextField.stringValue=[AppDelegate getStaticUser].userEmailAdress;
        self.registerInfoViewController.phoneTextField.stringValue=[AppDelegate getStaticUser].userPhoneNumber;
        self.registerInfoViewController.passwordTextField.stringValue=[AppDelegate getStaticUser].userPassword;
        self.registerInfoViewController.selfIntroductionTextField.stringValue=[AppDelegate getStaticUser].userIntroduction;
    
    AppDelegate *appdelegate=[NSApp delegate];
    
    [appdelegate.mainWindowController.mainView setHidden:YES];
    [appdelegate.mainWindowController.musicView setHidden:YES];
    [appdelegate.mainWindowController.movieView setHidden:YES];
    [appdelegate.mainWindowController.movieDetailViewController.view setHidden:YES];
    [appdelegate.mainWindowController.window.contentView addSubview:self.modifyView];
        [self.favoriteView setHidden:YES];
       
    }
}


-(IBAction)clickFavoriteBtn:(id)sender{

    self.favoriteListViewController=[[FavoriteListViewController alloc]initWithNibName:@"FavoriteListViewController" bundle:nil];
    self.favoriteView=self.favoriteListViewController.view;
    NSRect favoriteFrame=NSMakeRect(179, 47.5, 846, 468);
    [self.favoriteView setFrame:favoriteFrame];
    
    AppDelegate *appdelegate=[NSApp delegate];
    
    [appdelegate.mainWindowController.mainView setHidden:YES];
    [appdelegate.mainWindowController.musicView setHidden:YES];
    [appdelegate.mainWindowController.movieView setHidden:YES];
    [appdelegate.mainWindowController.movieDetailViewController.view setHidden:YES];
    [appdelegate.mainWindowController.window.contentView addSubview:self.favoriteView];



}
















@end
