
//
//  ExpenseViewController.h
//  MyMoney
//
//  Created by Parag Dulam on 14/01/16.
//  Copyright © 2016 Parag Dulam. All rights reserved.
//

#import "ViewController.h"

@interface ExpenseViewController : ViewController

@property (weak, nonatomic) IBOutlet UITextField *expenseAmount;
@property (weak, nonatomic) IBOutlet UITextField *expenseDiscription;
@property (strong,nonatomic) NSDate *expDate;
@property (strong,nonatomic) NSString *title;
//@property (strong,nonatomic) NSString *type;




@property (weak, nonatomic) IBOutlet UITextField *expenceDate;

@property (weak, nonatomic) IBOutlet UITextField *expenceReason;

-(IBAction)saveInformation:(id)sender;
-(IBAction)cancelExpence:(id)sender;
@property (weak, nonatomic) IBOutlet UINavigationBar *MainNavigationBar;

@property (weak,nonatomic) IBOutlet UINavigationItem *item;


@end
