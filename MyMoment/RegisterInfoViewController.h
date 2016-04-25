//
//  RegisterInfoViewController.h
//  MyMoment
//
//  Created by Edward Liu on 16/4/13.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface RegisterInfoViewController : NSViewController

@property IBOutlet NSTextField *accountTextField;
@property IBOutlet NSTextField *ageTextField;
@property IBOutlet NSMatrix *sexMatrix;
@property IBOutlet NSTextField *emailTextField;
@property IBOutlet NSTextField *phoneTextField;
@property IBOutlet NSTextField *passwordTextField;
@property IBOutlet NSTextField *selfIntroductionTextField;
@property IBOutlet NSButton *submitBtn;

@property IBOutlet NSTextField *accountAttentionLabel;
@property IBOutlet NSTextField *passwordAttentionLabel;


@end
