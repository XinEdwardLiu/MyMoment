//
//  XJMovie+CoreDataProperties.h
//  MyMoment
//
//  Created by KeysXu on 5/6/16.
//  Copyright © 2016 Edward Liu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "XJMovie.h"

NS_ASSUME_NONNULL_BEGIN

@interface XJMovie (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<XJComment *> *movie_comments;

@end

@interface XJMovie (CoreDataGeneratedAccessors)

- (void)addMovie_commentsObject:(XJComment *)value;
- (void)removeMovie_commentsObject:(XJComment *)value;
- (void)addMovie_comments:(NSSet<XJComment *> *)values;
- (void)removeMovie_comments:(NSSet<XJComment *> *)values;

@end

NS_ASSUME_NONNULL_END
