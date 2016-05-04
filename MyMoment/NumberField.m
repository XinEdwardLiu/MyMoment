//
//  NumberField.m
//  MyMoment
//
//  Created by Edward Liu on 16/5/3.
//  Copyright © 2016年 Edward Liu. All rights reserved.
//

#import "NumberField.h"

@implementation NumberField

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

-(void) textDidEndEditing:(NSNotification *)aNotification {
    // replace content with its intValue ( or process the input's value differently )
   // [self setIntValue:[self intValue]];
    // make sure the notification is sent back to any delegate
    
    if ([self.stringValue containsString:@"@"]) {
        return;
    }
    else{
        self.stringValue=@"";
    self.placeholderString=@"输入不正确";
    }
    
   [super controlTextDidEndEditing:aNotification];
}

@end
