//
//  MovieDetailViewController.m
//  MyMoment
//
//  Created by Edward Liu on 16/4/8.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "AppDelegate.h"
#import "FavoriteMovie.h"
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
    
     score=[[selectedMovie valueForKey:@"score"] floatValue];
    
    NSImage *scoreStarImage;
    
     if (score>=4.5) {
            scoreStarImage=[NSImage imageNamed:@"5star"];
        }
        else if(score>=3.5&score<4.5){
            scoreStarImage=[NSImage imageNamed:@"4star"];
        }
        else if(score>=2.5&score<3.5){
            scoreStarImage=[NSImage imageNamed:@"3star"];
        }
        else if(score>=1.5&score<2.5){
            scoreStarImage=[NSImage imageNamed:@"2star"];
        }
        else if(score<1.5){
            scoreStarImage=[NSImage imageNamed:@"1star"];
        }
        [self.resultStarImageView setImage:scoreStarImage];
    
    self.messageMutableArray=[selectedMovie valueForKey:@"commentMutableArray"];
    [AppDelegate setStaticCommentMutableArray:self.messageMutableArray];
    
    if ([AppDelegate getStaticAccountState]==NO) {
        [self.addToFavoriteBtn setHidden:YES];
    }
    else{
        
        [self.addToFavoriteBtn setHidden:NO];
    }
    
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


-(IBAction)clickAddToFavoriteBtn:(id)sender{
    Movie *tempMovie=[AppDelegate getStaticMovie];
    NSMutableArray *temperFavoriteListMutableArray=[[NSMutableArray alloc]initWithArray:[AppDelegate getStaticFavoriteListMutableArray]];
    if (tempMovie.isFavorite==NO) {
        tempMovie.isFavorite=YES;
        FavoriteMovie *tempFavoriteMovie=[[FavoriteMovie alloc]initWithName:tempMovie.name WithImage:tempMovie.image WithTypes:tempMovie.types WithAuthor:tempMovie.author WithIntroduction:tempMovie.introduction WithCommentMutableArray:tempMovie.commentMutableArray WithScore:tempMovie.score WithIsFavorite:tempMovie.isFavorite WithUserName:[AppDelegate getStaticUser].userName];
        [temperFavoriteListMutableArray addObject:tempFavoriteMovie];
        [AppDelegate setstaticFavoriteListMutableArray:temperFavoriteListMutableArray];
        [self.addToFavoriteBtn setImage:[NSImage imageNamed:@"Heart_Full"]];
        [self.addToFavoriteBtn setTitle:@""];
        [AppDelegate setStaticMovie:tempMovie];
        
    }
    
   else if(tempMovie.isFavorite==YES)
   {   [self.addToFavoriteBtn setImage:[NSImage imageNamed:@"Heart_Full"]];
       [self.addToFavoriteBtn setTitle:@"已收"];
       return;
   }
    
    
    
    AppDelegate *appdelegate=[NSApp delegate];
    [appdelegate.mainWindowController.registerViewController.favoriteListViewController.favoriteListTableView reloadData];
    NSLog(@"%@",[AppDelegate getStaticFavoriteListMutableArray]);
    NSLog(@"%@",[AppDelegate getStaticMovie].name);
    
}

@end
