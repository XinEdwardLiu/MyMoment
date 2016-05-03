//
//  RegisterInfoViewController.m
//  MyMoment
//
//  Created by Edward Liu on 16/4/13.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import "RegisterInfoViewController.h"
#import "AppDelegate.h"

@interface RegisterInfoViewController ()


@end

@implementation RegisterInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}


-(IBAction)clickSubmitBtn:(id)sender{
    
    
    if ([self.accountTextField.stringValue isEqualToString:@""]&[self.passwordTextField.stringValue isEqualToString:@""]) {
        [self.accountAttentionLabel setHidden:NO];
        [self.passwordAttentionLabel setHidden:NO];
        return;
    }
    else if([self.accountTextField.stringValue isEqualToString:@""]&[self.passwordTextField.stringValue isNotEqualTo:@""]){
        [self.accountAttentionLabel setHidden:NO];
        [self.passwordAttentionLabel setHidden:YES];
        return;
    }
    else if ([self.accountTextField.stringValue isNotEqualTo:@""]&[self.passwordTextField.stringValue isEqualTo:@""]){
        [self.passwordAttentionLabel setHidden:NO];
        [self.accountAttentionLabel setHidden:YES];
        return;
    }
    else if([self.accountTextField.stringValue isNotEqualTo:@""]&[self.passwordTextField.stringValue isNotEqualTo:@""]){
        
        if ([AppDelegate getStaticAccountState]==NO){
        
        AppDelegate *appdelegate=[NSApp delegate];
        appdelegate.mainWindowController.registerViewController.nameLabel.stringValue=self.accountTextField.stringValue;
        [self.view setHidden:YES];
        [appdelegate.mainWindowController.mainView setHidden:NO];
        [appdelegate.mainWindowController.registerViewController.favoriteListBtn setHidden:NO];
        [appdelegate.mainWindowController.registerViewController.historyListBtn setHidden:NO];
        [appdelegate.mainWindowController.registerViewController.accountTextField setHidden:YES];
        [appdelegate.mainWindowController.registerViewController.passwordTextField setHidden:YES];
        [appdelegate.mainWindowController.registerViewController.aboardBtn setHidden:YES];
        [appdelegate.mainWindowController.registerViewController.registerBtn setHidden:YES];
        [appdelegate.mainWindowController.registerViewController.quitBtn setHidden:NO];
            [appdelegate.mainWindowController.registerViewController.attentionLabel setHidden:YES];
        BOOL accountState=YES;
        [AppDelegate setStaticAcccountState:accountState];
        
        User *temperUser=[[User alloc]initWithName:self.accountTextField.stringValue WithAge:self.ageTextField.stringValue WithSex:self.sexMatrix.selectedCell.stringValue WithEmailAdress:self.emailTextField.stringValue WithPhoneNumber:self.phoneTextField.stringValue WithPassword:self.passwordTextField.stringValue WithIntroduction:self.selfIntroductionTextField.stringValue];
        NSMutableArray *temperUserMutableArray=[AppDelegate getStaticUserMutableArray];
        [temperUserMutableArray addObject:temperUser];
        [AppDelegate setstaticUserMutableArray:temperUserMutableArray];
        [AppDelegate setStaticUser:temperUser];
        [AppDelegate setStaticUserRow:([temperUserMutableArray count]-1)];
        }
        
        else if ([AppDelegate getStaticAccountState]==YES){
            User *temperUser=[[User alloc]initWithName:self.accountTextField.stringValue WithAge:self.ageTextField.stringValue WithSex:self.sexMatrix.selectedCell.stringValue WithEmailAdress:self.emailTextField.stringValue WithPhoneNumber:self.phoneTextField.stringValue WithPassword:self.passwordTextField.stringValue WithIntroduction:self.selfIntroductionTextField.stringValue];
            [AppDelegate setStaticUser:temperUser];
            NSMutableArray *temperUserMutableArray=[AppDelegate getStaticUserMutableArray];
            [temperUserMutableArray setObject:temperUser atIndexedSubscript:[AppDelegate getStaticUserRow]];
            [AppDelegate setstaticUserMutableArray:temperUserMutableArray];
            [self.view setHidden:YES];
            AppDelegate *appdelegate=[NSApp delegate];
            appdelegate.mainWindowController.registerViewController.nameLabel.stringValue=temperUser.userName;
            [appdelegate.mainWindowController.mainView setHidden:NO];
          
        
        }
        
    }
    
    
    
 
}

@end
