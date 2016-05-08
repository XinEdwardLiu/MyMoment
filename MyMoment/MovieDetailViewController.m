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
-(void)viewWillAppear{
    //[self.messageTableView reloadData];
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    Movie *selectedMovie=[AppDelegate getStaticMovie];
    
    self.nameLabel.stringValue=[selectedMovie valueForKey:@"name"];
    self.styleLabel.stringValue=[selectedMovie valueForKey:@"types"];
    self.authorLabel.stringValue=[selectedMovie valueForKey:@"author"];
    self.introductionLabel.stringValue=[selectedMovie valueForKey:@"introduction"];
    self.resultScoreLabel.stringValue=[selectedMovie valueForKey:@"score"];
    
    self.score=[[selectedMovie valueForKey:@"score"] floatValue];
    
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
    
    self.messageMutableArray=[[NSMutableArray alloc]initWithArray:selectedMovie.commentMutableArray];
    //[AppDelegate setStaticCommentMutableArray:[staticMovie valueForKey:@"commentMutableArray"]];
    
    if ([AppDelegate getStaticAccountState]==NO) {
        [self.addToFavoriteBtn setHidden:YES];
    }
    else{
        
        [self.addToFavoriteBtn setHidden:NO];
    }
    
    [self.messageTableView reloadData];
   // NSLog(@"%@",self.messageMutableArray);
   // NSLog(@"%@",[[AppDelegate getStaticMovie] valueForKey:@"name"]);
   // NSLog(@"%@",[[[[AppDelegate getStaticMovie] valueForKey:@"commentMutableArray"] objectAtIndex:0] valueForKey:@"comment"]);
    
    NSLog(@"%@",[[[AppDelegate getStaticMovieMutableArray] objectAtIndex:0] valueForKey:@"commentMutableArray"]);
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
            //[self.messageMutableArray addObject:temperMessage];
            [self.messageMutableArray addObject:temperMessage];
             NSLog(@"%@",self.messageMutableArray);
            [self.messageTableView reloadData];
            
            NSMutableArray *movieTableListMuTableArray=[[NSMutableArray alloc]initWithArray:[AppDelegate getStaticMovieMutableArray]];
            Movie *tempMovie=[movieTableListMuTableArray objectAtIndex:[AppDelegate getStaticMovieRow]];
            [tempMovie.commentMutableArray removeAllObjects];
            [tempMovie.commentMutableArray addObject:self.messageMutableArray];
            NSLog(@"%@",tempMovie.commentMutableArray);
            
            //Movie *selectedMovie=[AppDelegate getStaticMovie];
            //selectedMovie.commentMutableArray=self.messageMutableArray;
            
           // [AppDelegate setStaticMovie:selectedMovie];
            
            //[AppDelegate setStaticCommentMutableArray:self.messageMutableArray];
            
            // self.selectedMovie.commentMutableArray=self.messageMutableArray;
            
            // [AppDelegate setStaticMovie:self.selectedMovie];
           
           // NSLog(@"%@",[[AppDelegate getStaticMovie] valueForKey:@"name"]);
           // NSLog(@"%@",[[AppDelegate getStaticMovie] valueForKey:@"commentMutableArray"]);
            
            //[appdelegate.mainWindowController.mainMovieTableView reloadData];
            NSLog(@"%@",[[[AppDelegate getStaticMovieMutableArray] objectAtIndex:1] valueForKey:@"commentMutableArray"]);
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
-(IBAction)clickOneScoreBtn:(id)sender{

    [self.oneScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.twoScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    [self.threeScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    [self.fourScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    [self.fiveScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    self.score=1;
    [self.scoreTextField setStringValue: [NSNumber numberWithFloat:self.score]];
}


-(IBAction)clickTwoScoreBtn:(id)sender{
    [self.oneScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.twoScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.threeScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    [self.fourScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    [self.fiveScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    self.score=2;
      [self.scoreTextField setStringValue: [NSNumber numberWithInt:self.score]];
}

-(IBAction)clickThreeScoreBtn:(id)sender{
    [self.oneScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.twoScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.threeScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.fourScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    [self.fiveScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    self.score=3;
      [self.scoreTextField setStringValue: [NSNumber numberWithInt:self.score]];
}

-(IBAction)clickFourScoreBtn:(id)sender{
    [self.oneScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.twoScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.threeScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.fourScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.fiveScoreBtn setImage:[NSImage imageNamed:@"1starEmpty"]];
    self.score=4;
      [self.scoreTextField setStringValue: [NSNumber numberWithInt:self.score]];
}

-(IBAction)clickFiveScoreBtn:(id)sender{
    [self.oneScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.twoScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.threeScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.fourScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    [self.fiveScoreBtn setImage:[NSImage imageNamed:@"1star"]];
    self.score=5;
      [self.scoreTextField setStringValue: [NSNumber numberWithInt:self.score]];
}


-(IBAction)clickSaveScoreBtn:(id)sender
{
    BOOL accountState=[AppDelegate getStaticAccountState];
    
    if (accountState==YES) {
        float newScore=(self.score+[self.resultScoreLabel.stringValue floatValue])/2;
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
    
    NSString *tempMovieName=tempMovie.name;
    
    if ([temperFavoriteListMutableArray count]==0)
    {
        FavoriteMovie *tempFavoriteMovie=[[FavoriteMovie alloc]initWithName:tempMovie.name WithImage:tempMovie.image WithTypes:tempMovie.types WithAuthor:tempMovie.author WithIntroduction:tempMovie.introduction WithCommentMutableArray:tempMovie.commentMutableArray WithScore:tempMovie.score WithIsFavorite:tempMovie.isFavorite WithUserName:[AppDelegate getStaticUser].userName];
        [temperFavoriteListMutableArray addObject:tempFavoriteMovie];
        [AppDelegate setstaticFavoriteListMutableArray:temperFavoriteListMutableArray];
        [self.addToFavoriteBtn setImage:[NSImage imageNamed:@"Heart_Full"]];
        [self.addToFavoriteBtn setTitle:@""];
        
    }
    else
    {
        NSMutableArray *listNameMutableArray=[[NSMutableArray alloc]init];
        for (NSInteger i=0; i<[temperFavoriteListMutableArray count]; i++)
        {
        NSString *tempName=[[temperFavoriteListMutableArray objectAtIndex:i] valueForKey:@"name"];
       
            [listNameMutableArray addObject:tempName];
        }
        
        if ([listNameMutableArray containsObject:tempMovieName ])
        
            return;
        
        else
        {
        
            FavoriteMovie *tempFavoriteMovie=[[FavoriteMovie alloc]initWithName:tempMovie.name WithImage:tempMovie.image WithTypes:tempMovie.types WithAuthor:tempMovie.author WithIntroduction:tempMovie.introduction WithCommentMutableArray:tempMovie.commentMutableArray WithScore:tempMovie.score WithIsFavorite:tempMovie.isFavorite WithUserName:[AppDelegate getStaticUser].userName];
            [temperFavoriteListMutableArray addObject:tempFavoriteMovie];
            [AppDelegate setstaticFavoriteListMutableArray:temperFavoriteListMutableArray];
            [self.addToFavoriteBtn setImage:[NSImage imageNamed:@"Heart_Full"]];
            [self.addToFavoriteBtn setTitle:@""];
            
        }
        
    }
//    if (tempMovie.isFavorite==NO) {
//        tempMovie.isFavorite=YES;
//        FavoriteMovie *tempFavoriteMovie=[[FavoriteMovie alloc]initWithName:tempMovie.name WithImage:tempMovie.image WithTypes:tempMovie.types WithAuthor:tempMovie.author WithIntroduction:tempMovie.introduction WithCommentMutableArray:tempMovie.commentMutableArray WithScore:tempMovie.score WithIsFavorite:tempMovie.isFavorite WithUserName:[AppDelegate getStaticUser].userName];
//        [temperFavoriteListMutableArray addObject:tempFavoriteMovie];
//        [AppDelegate setstaticFavoriteListMutableArray:temperFavoriteListMutableArray];
//        [self.addToFavoriteBtn setImage:[NSImage imageNamed:@"Heart_Full"]];
//        [self.addToFavoriteBtn setTitle:@""];
//        [AppDelegate setStaticMovie:tempMovie];
        
//    }
    
//   else if(tempMovie.isFavorite==YES)
//   {   [self.addToFavoriteBtn setImage:[NSImage imageNamed:@"Heart_Full"]];
//       [self.addToFavoriteBtn setTitle:@"已收"];
//       return;
//   }
    
    [AppDelegate setstaticFavoriteListMutableArray:temperFavoriteListMutableArray];
    
    AppDelegate *appdelegate=[NSApp delegate];
    [appdelegate.mainWindowController.registerViewController.favoriteListViewController.favoriteListTableView reloadData];
    NSLog(@"%@",[AppDelegate getStaticFavoriteListMutableArray]);
    NSLog(@"%@",[AppDelegate getStaticMovie].name);
    
}

@end
