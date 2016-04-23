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
    Movie *selectedMovie=[AppDelegate getStaticMovie];
    
    self.nameLabel.stringValue=[selectedMovie valueForKey:@"name"];
    self.styleLabel.stringValue=[selectedMovie valueForKey:@"types"];
    self.authorLabel.stringValue=[selectedMovie valueForKey:@"author"];
    self.introductionLabel.stringValue=[selectedMovie valueForKey:@"introduction"];
    self.resultScoreLabel.stringValue=[selectedMovie valueForKey:@"score"];
    float score=[[selectedMovie valueForKey:@"score"] floatValue];
    
    NSImage *scoreStarImage;
    
     if (score==5.0) {
            scoreStarImage=[NSImage imageNamed:@"5star"];
        }
        else if(score==4.0){
            scoreStarImage=[NSImage imageNamed:@"4star"];
        }
        else if(score==3.0){
            scoreStarImage=[NSImage imageNamed:@"3star"];
        }
        else if(score==2.0){
            scoreStarImage=[NSImage imageNamed:@"2star"];
        }
        else if(score==1.0){
            scoreStarImage=[NSImage imageNamed:@"1star"];
        }
        [self.resultStarImageView setImage:scoreStarImage];
    
    self.messageMutableArray=[selectedMovie valueForKey:@"commentMutableArray"];
    [AppDelegate setStaticCommentMutableArray:self.messageMutableArray];
    
}

-(IBAction)clickSubmitMessageBtn:(id)sender{
    
    if([AppDelegate getStaticAccountState]==NO){
        
            NSAlert *alert = [[NSAlert alloc] init];
            [alert addButtonWithTitle:@"确认"];
            [alert setMessageText:@"评论前请先登陆"];
            [alert setInformativeText:@"若无登陆账号，请先注册"];
            [alert setAlertStyle:NSInformationalAlertStyle];
            [alert runModal];
    
    }
    else if([AppDelegate getStaticAccountState]==YES){
        AppDelegate *appdelegate=[NSApp delegate];
        NSString *temperSender=appdelegate.mainWindowController.registerViewController.nameLabel.stringValue;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterShortStyle;
        
        NSString *temperTime=[dateFormatter stringFromDate:[NSDate date]];
    if ([self.messageTextField.stringValue isEqual:@""]) {
        return;
    }
    else{
        self.message=self.messageTextField.stringValue;
        Message *temperMessage=[[Message alloc]initWithSender:temperSender WithComment:self.message WithTime:temperTime];
        [self.messageMutableArray addObject:temperMessage];
        [AppDelegate setStaticCommentMutableArray:self.messageMutableArray];
    }
    [self.messageTableView reloadData];
    }
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
    return [[AppDelegate getStaticCommentMutableArray] count];
}


-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{

     return [[[AppDelegate getStaticCommentMutableArray] objectAtIndex:row] valueForKey:[tableColumn identifier]];

}

-(IBAction)clickSaveScoreBtn:(id)sender
{
    BOOL accountState=[AppDelegate getStaticAccountState];
    
    if (accountState==YES) {
        float newScore=(score+[self.resultScoreLabel.stringValue floatValue])/2;
        [AppDelegate getStaticMovie].score=newScore;
        
        NSLog(@"%f",[AppDelegate getStaticMovie].score);
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
