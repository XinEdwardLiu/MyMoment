//
//  XJUser+CoreDataProperties.h
//  MyMoment
//
//  Created by KeysXu on 5/6/16.
//  Copyright © 2016 Edward Liu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "XJUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface XJUser (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *password;
@property (nullable, nonatomic, retain) NSSet<XJComment *> *user_comments;

@end

@interface XJUser (CoreDataGeneratedAccessors)

- (void)addUser_commentsObject:(XJComment *)value;
- (void)removeUser_commentsObject:(XJComment *)value;
- (void)addUser_comments:(NSSet<XJComment *> *)values;
- (void)removeUser_comments:(NSSet<XJComment *> *)values;

@end

NS_ASSUME_NONNULL_END
