//
//  MusicDetailViewController.m
//  MyMoment
//
//  Created by Edward Liu on 16/4/15.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import "MusicDetailViewController.h"

@interface MusicDetailViewController ()

@end

@implementation MusicDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    self.selectedMusic=[AppDelegate getStaticMusic];
    
    self.nameLabel.stringValue=[self.selectedMusic valueForKey:@"name"];
    self.styleLabel.stringValue=[self.selectedMusic valueForKey:@"types"];
    self.authorLabel.stringValue=[self.selectedMusic valueForKey:@"author"];
    self.introductionLabel.stringValue=[self.selectedMusic valueForKey:@"introduction"];
    self.resultScoreLabel.stringValue=[self.selectedMusic valueForKey:@"score"];
    
    self.score=[[self.selectedMusic valueForKey:@"score"] floatValue];
    
    NSImage *scoreStarImage;
    
    if ( self.score>=4.5) {
        scoreStarImage=[NSImage imageNamed:@"5star"];
    }
    else if( self.score>=3.5&self.score<4.5){
        scoreStarImage=[NSImage imageNamed:@"4star"];
    }
    else if(self.score>=2.5&self.score<3.5){
        scoreStarImage=[NSImage imageNamed:@"3star"];
    }
    else if(self.score>=1.5&self.score<2.5){
        scoreStarImage=[NSImage imageNamed:@"2star"];
    }
    else if(self.score<1.5){
        scoreStarImage=[NSImage imageNamed:@"1star"];
    }
    [self.resultStarImageView setImage:scoreStarImage];
    
    self.messageMutableArray=[[NSMutableArray alloc]initWithArray:self.selectedMusic.commentMutableArray];
    [self.messageTableView reloadData];
        
    if ([AppDelegate getStaticAccountState]==NO) {
        [self.addToFavoriteBtn setHidden:YES];
    }
    else{
        [self.addToFavoriteBtn setHidden:NO];
    }
}

-(IBAction)clickOneScoreBtn:(id)sender{
    
    [self.oneScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.twoScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    [self.threeScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    [self.fourScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    [self.fiveScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    self.score=1;
    [self.scoreTextField setStringValue: [[NSNumber numberWithFloat:self.score] stringValue]];
}


-(IBAction)clickTwoScoreBtn:(id)sender{
    [self.oneScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.twoScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.threeScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    [self.fourScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    [self.fiveScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    self.score=2;
    [self.scoreTextField setStringValue: [[NSNumber numberWithInt:self.score] stringValue]];
}

-(IBAction)clickThreeScoreBtn:(id)sender{
    [self.oneScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.twoScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.threeScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.fourScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    [self.fiveScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    self.score=3;
    [self.scoreTextField setStringValue: [[NSNumber numberWithInt:self.score] stringValue]];
}

-(IBAction)clickFourScoreBtn:(id)sender{
    [self.oneScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.twoScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.threeScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.fourScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.fiveScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    self.score=4;
    [self.scoreTextField setStringValue: [[NSNumber numberWithInt:self.score] stringValue]];
}

-(IBAction)clickFiveScoreBtn:(id)sender{
    [self.oneScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.twoScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.threeScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.fourScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.fiveScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    self.score=5;
    [self.scoreTextField setStringValue: [[NSNumber numberWithInt:self.score] stringValue]];
}

-(IBAction)clickSaveScoreBtn:(id)sender
{
    BOOL accountState=[AppDelegate getStaticAccountState];
    
    if (accountState==YES) {
        float newScore=(self.score+[self.resultScoreLabel.stringValue floatValue])/2;
        [AppDelegate getStaticMusic].score=newScore;
        
        NSLog(@"%@",[[NSNumber numberWithFloat:[AppDelegate getStaticMusic].score] stringValue]);
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

-(IBAction)clickSubmitMessageBtn:(id)sender{
    if([AppDelegate getStaticAccountState]==YES)
    {
        
        if ([self.messageTextField.stringValue isEqual:@""]){
            return;
        }
        else
        {
            AppDelegate *appdelegate=[NSApp delegate];
            NSString *temperSender=appdelegate.mainWindowController.registerViewController.nameLabel.stringValue;
            
            //set date formatter
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            dateFormatter.dateStyle = NSDateFormatterMediumStyle;
            dateFormatter.timeStyle = NSDateFormatterShortStyle;
            NSString *temperTime=[dateFormatter stringFromDate:[NSDate date]];
            //end
            
            self.message=self.messageTextField.stringValue;
            Message *temperMessage=[[Message alloc]initWithSender:temperSender WithComment:self.message WithTime:temperTime];
            [self.messageMutableArray insertObject:temperMessage atIndex:0];
            [self.messageTableView reloadData];
            
            NSMutableArray *musicTableListMuTableArray=[[NSMutableArray alloc]initWithArray:[AppDelegate getStaticMovieMutableArray]];
            [self.selectedMusic.commentMutableArray setArray:self.messageMutableArray];
            [musicTableListMuTableArray removeObjectAtIndex:[AppDelegate getStaticMovieRow]];
            [musicTableListMuTableArray insertObject:self.selectedMusic atIndex:[AppDelegate getStaticMovieRow]];
            [AppDelegate setStaticMusicMutableArray:musicTableListMuTableArray];
            [appdelegate.mainWindowController.mainMusicTableView reloadData];
            
        }
        
    }
    else if([AppDelegate getStaticAccountState]==NO)
    {
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"确认"];
        [alert setMessageText:@"评论前请先登陆"];
        [alert setInformativeText:@"若无登陆账号，请先注册"];
        [alert setAlertStyle:NSInformationalAlertStyle];
        [alert runModal];
    }

}

-(IBAction)clickAddToFavoriteBtn:(id)sender{
    Music *tempMusic=[AppDelegate getStaticMusic];
    NSMutableArray *temperMusicFavoriteListMutableArray=[[NSMutableArray alloc]initWithArray:[AppDelegate getStaticMusicFavoriteListMutableArray]];
    
    NSString *tempMusicName=tempMusic.name;
    if ([temperMusicFavoriteListMutableArray count]==0)
    {
        FavoriteMusic *tempFavoriteMusic=[[FavoriteMusic alloc]initWithName:tempMusic.name WithImage:tempMusic.image WithTypes:tempMusic.types WithAuthor:tempMusic.author WithIntroduction:tempMusic.introduction WithCommentMutableArray:tempMusic.commentMutableArray WithScore:tempMusic.score WithIsFavorite:tempMusic.isFavorite WithUserName:[AppDelegate getStaticUser].userName];
        [temperMusicFavoriteListMutableArray addObject:tempFavoriteMusic];
        [AppDelegate setstaticMusicFavoriteListMutableArray:temperMusicFavoriteListMutableArray];
        [self.addToFavoriteBtn setImage:[NSImage imageNamed:@"Heart_Full"]];
        [self.addToFavoriteBtn setTitle:@""];
        
    }
    else
    {
        NSMutableArray *listNameMutableArray=[[NSMutableArray alloc]init];
        for (NSInteger i=0; i<[temperMusicFavoriteListMutableArray count]; i++)
        {
            NSString *tempName=[[temperMusicFavoriteListMutableArray objectAtIndex:i] valueForKey:@"name"];
            
            [listNameMutableArray addObject:tempName];
        }
        
        if ([listNameMutableArray containsObject:tempMusicName ])
            
            return;
        
        else
        {
            
            FavoriteMusic *tempFavoriteMusic=[[FavoriteMusic alloc]initWithName:tempMusic.name WithImage:tempMusic.image WithTypes:tempMusic.types WithAuthor:tempMusic.author WithIntroduction:tempMusic.introduction WithCommentMutableArray:tempMusic.commentMutableArray WithScore:tempMusic.score WithIsFavorite:tempMusic.isFavorite WithUserName:[AppDelegate getStaticUser].userName];
            [temperMusicFavoriteListMutableArray addObject:tempFavoriteMusic];
            [AppDelegate setstaticMusicFavoriteListMutableArray:temperMusicFavoriteListMutableArray];
            [self.addToFavoriteBtn setImage:[NSImage imageNamed:@"Heart_Full"]];
            [self.addToFavoriteBtn setTitle:@""];
            
        }
        
    }
    
    [AppDelegate setstaticMusicFavoriteListMutableArray:temperMusicFavoriteListMutableArray];
    
    AppDelegate *appdelegate=[NSApp delegate];
    [appdelegate.mainWindowController.registerViewController.favoriteListViewController.musicFavoriteListTableView reloadData];
}


-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return [self.messageMutableArray count];
}

-(NSView*)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    if ([tableColumn.identifier isEqual:@"sender"]) {
        NSTextField *senderLabel=[tableView makeViewWithIdentifier:@"sender" owner:self];
        senderLabel.stringValue=[[self.messageMutableArray objectAtIndex:row] valueForKey:@"sender"];
        return senderLabel;
    }
    if ([tableColumn.identifier isEqual:@"comment"]) {
        NSTextField *commentLabel=[tableView makeViewWithIdentifier:@"comment" owner:self];
        commentLabel.stringValue=[[self.messageMutableArray objectAtIndex:row] valueForKey:@"comment"];
        return commentLabel;
    }
    if ([tableColumn.identifier isEqual:@"time"]) {
        NSTextField *timeLabel=[tableView makeViewWithIdentifier:@"time" owner:self];
        timeLabel.stringValue=[[self.messageMutableArray objectAtIndex:row] valueForKey:@"time"];
        return timeLabel;
    }
    return nil;
}

@end
