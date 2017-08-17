//
//  XJComment+CoreDataProperties.h
//  MyMoment
//
//  Created by KeysXu on 5/6/16.
//  Copyright © 2016 Edward Liu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "XJComment.h"

NS_ASSUME_NONNULL_BEGIN

@interface XJComment (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *content;
@property (nullable, nonatomic, retain) XJUser *author;
@property (nullable, nonatomic, retain) XJMovie *movie;

@end

NS_ASSUME_NONNULL_END
