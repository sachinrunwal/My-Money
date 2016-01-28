//
//  LoginDetails+CoreDataProperties.h
//  MyMoney
//
//  Created by Parag Dulam on 09/01/16.
//  Copyright © 2016 Parag Dulam. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "LoginDetails.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginDetails (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *useName;
@property (nullable, nonatomic, retain) NSString *firstName;
@property (nullable, nonatomic, retain) NSString *password;

@end

NS_ASSUME_NONNULL_END
