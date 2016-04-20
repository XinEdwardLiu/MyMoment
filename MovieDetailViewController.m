//
//  MovieDetailViewController.m
//  MyMoment
//
//  Created by Edward Liu on 16/4/8.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "AppDelegate.h"
@interface MovieDetailViewController ()



@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

-(IBAction)clickSubmitMessageBtn:(id)sender{

    if (self.messageTextField.stringValue==NULL) {
        return;
    }
    else{
        self.message=self.messageTextField.stringValue;
    
       // [self.messageTableView reloadData];
    }
    NSLog(@"%@",self.message);
}


-(IBAction)clickOneScoreBtn:(id)sender{

    [self.oneScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.twoScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    [self.threeScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    [self.fourScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    [self.fiveScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    score=1;
    [self.scoreTextField setStringValue: [NSNumber numberWithInt:score]];
}


-(IBAction)clickTwoScoreBtn:(id)sender{
    [self.oneScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.twoScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.threeScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    [self.fourScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    [self.fiveScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    score=2;
      [self.scoreTextField setStringValue: [NSNumber numberWithInt:score]];
}

-(IBAction)clickThreeScoreBtn:(id)sender{
    [self.oneScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.twoScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.threeScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.fourScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    [self.fiveScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    score=3;
      [self.scoreTextField setStringValue: [NSNumber numberWithInt:score]];
}

-(IBAction)clickFourScoreBtn:(id)sender{
    [self.oneScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.twoScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.threeScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.fourScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.fiveScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    score=4;
      [self.scoreTextField setStringValue: [NSNumber numberWithInt:score]];
}

-(IBAction)clickFiveScoreBtn:(id)sender{
    [self.oneScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.twoScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.threeScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.fourScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.fiveScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    score=5;
      [self.scoreTextField setStringValue: [NSNumber numberWithInt:score]];
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView{
    return 10;
}

-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    
    return @"111";
}

-(IBAction)clickSaveScoreBtn:(id)sender
{
    BOOL accountState=[AppDelegate getStaticAccountState];
    
    if (accountState==YES) {
        NSLog(@"aboard sucess,打分成功");
    }
    else{
    NSAlert *alert = [[NSAlert alloc] init];
    [alert addButtonWithTitle:@"确认"];
    [alert setMessageText:@"评分前请先登陆"];
    [alert setInformativeText:@"若无登陆账号，请先注册"];
    [alert setAlertStyle:NSInformationalAlertStyle];
    [alert runModal];
    }
}
@end
