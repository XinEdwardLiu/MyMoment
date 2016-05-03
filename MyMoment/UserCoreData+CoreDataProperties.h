//
//  UserCoreData+CoreDataProperties.h
//  
//
//  Created by Edward Liu on 16/5/1.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "UserCoreData.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserCoreData (CoreDataProperties)

@property (nullable, nonatomic, retain) NSData *userArrayData;

@end

NS_ASSUME_NONNULL_END
