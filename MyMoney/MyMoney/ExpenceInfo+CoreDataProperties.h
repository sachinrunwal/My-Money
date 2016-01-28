//
//  ExpenceInfo+CoreDataProperties.h
//  MyMoney
//
//  Created by Parag Dulam on 26/01/16.
//  Copyright © 2016 Parag Dulam. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ExpenceInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExpenceInfo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSString *discription;
@property (nullable, nonatomic, retain) NSNumber *amount;
@property (nullable, nonatomic, retain) NSString *reason;
@property (nullable, nonatomic, retain) NSNumber *type;

@end

NS_ASSUME_NONNULL_END
