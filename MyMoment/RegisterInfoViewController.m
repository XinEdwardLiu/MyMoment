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
@property IBOutlet NSTextField *accountTextField;
@property IBOutlet NSTextField *ageTextField;
@property IBOutlet NSMatrix *sexMatrix;
@property IBOutlet NSTextField *emailTextField;
@property IBOutlet NSTextField *phoneTextField;
@property IBOutlet NSTextField *passwordTextField;
@property IBOutlet NSTextField *selfIntroductionTextField;
@property IBOutlet NSButton *submitBtn;
@end

@implementation RegisterInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}


-(IBAction)clickSubmitBtn:(id)sender{
   
    if ([self.accountTextField.stringValue isEqualToString:@""]) {
        return;
    }
    else{
        
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
        BOOL accountState=YES;
        [AppDelegate setStaticAcccountState:accountState];
    
    }
    
 
}

@end
