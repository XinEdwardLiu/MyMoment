//
//  MainMovieTableViewController.m
//  MyMoment
//
//  Created by Edward Liu on 16/4/17.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import "MainMovieTableViewController.h"
#import "AppDelegate.h"
@implementation MainMovieTableViewController

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return 10;
    //return [[AppDelegate getStaticMovieMutableArray] count];
}

//-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    
//return [[[AppDelegate getStaticMovieMutableArray] objectAtIndex:row] valueForKey:[tableColumn identifier]];

//}


-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{

    NSString *columnIdentifier=[tableColumn identifier];
    NSMutableArray *mainMovieMutableArray=[AppDelegate getStaticMovieMutableArray];
    
    for (NSInteger y=0; y<10; y++)
    {
        
        if ([columnIdentifier isEqualToString:@"name"]) {
           
            NSTextField *nameLabel=[tableView makeViewWithIdentifier:@"name" owner:self];
            nameLabel.stringValue=[[mainMovieMutableArray objectAtIndex:row] valueForKey:@"name"];
            return nameLabel;
           // NSButton *nameBtn=[tableView makeViewWithIdentifier:@"name" owner:self];
           //[nameBtn setTitle:[[mainMovieMutableArray objectAtIndex:row] valueForKey:@"name"]];
         
            //改button title颜色
            
           // NSMutableAttributedString *attrTitle =
            //[[NSMutableAttributedString alloc] initWithString:[[mainMovieMutableArray objectAtIndex:row] valueForKey:@"name"]] ;
            //NSUInteger len = [attrTitle length];
            //NSRange range = NSMakeRange(0, len);
            //[attrTitle addAttribute:NSForegroundColorAttributeName value:[NSColor purpleColor] range:range];
            //[attrTitle fixAttributesInRange:range];
            //[nameBtn setAttributedTitle:attrTitle];
            // end
            
         // [nameBtn setAction: @selector(onNameBtnClick:)];
          //[nameBtn setIdentifier: [NSString stringWithFormat:@"%ld",(long)row]];
           // return nameBtn;
        }
        
        else if([columnIdentifier isEqualToString:@"author"])
        {
            NSTextField *authorLabel=[tableView makeViewWithIdentifier:@"author" owner:self];
            authorLabel.stringValue=[[mainMovieMutableArray objectAtIndex:row] valueForKey:@"author"];
            return authorLabel;
        }
    }
    return nil;
}




// out of use
-(IBAction)onNameBtnClick:(id)sender{

    NSLog(@"111");
    
        
        NSInteger row=self.mainMovieTableView.selectedRow;
        NSLog(@"%ld",self.mainMovieTableView.selectedRow);
        NSMutableArray *mainMovieMutableArry=[AppDelegate getStaticMovieMutableArray];
        
        AppDelegate *appdelegate=[NSApp delegate];
        appdelegate.mainWindowController.movieDetailViewController.nameLabel.stringValue=[[mainMovieMutableArry objectAtIndex:row] valueForKey:@"name"];
        appdelegate.mainWindowController.movieDetailViewController.styleLabel.stringValue=[[mainMovieMutableArry objectAtIndex:row] valueForKey:@"types"];
        appdelegate.mainWindowController.movieDetailViewController.authorLabel.stringValue=[[mainMovieMutableArry objectAtIndex:row] valueForKey:@"author"];
        appdelegate.mainWindowController.movieDetailViewController.introductionLabel.stringValue=[[mainMovieMutableArry objectAtIndex:row] valueForKey:@"introduction"];
        
        [appdelegate.mainWindowController.movieDetailViewController.imageView setImage:[[mainMovieMutableArry objectAtIndex:row] valueForKey:@"image"]];
        
        appdelegate.mainWindowController.movieDetailViewController.resultScoreLabel=[[mainMovieMutableArry objectAtIndex:row] valueForKey:@"score"];
        
        [appdelegate.mainWindowController.window.contentView addSubview:appdelegate.mainWindowController.movieDetailViewController.view];
        
    }

//out of use






@end
