//
//  ExpenseViewController.m
//  MyMoney
//
//  Created by Parag Dulam on 14/01/16.
//  Copyright © 2016 Parag Dulam. All rights reserved.
//

#import "ExpenseViewController.h"
#import "ExpenceInfo.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"


@interface ExpenseViewController ()
{
    AppDelegate *aDel;
}
@end

@implementation ExpenseViewController
@synthesize expDate;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDateFormatter *inFormat = [[NSDateFormatter alloc] init];
    [inFormat setDateFormat:@"dd-MMM-yy"];
    NSString *dateString = [inFormat stringFromDate:expDate];
    self.expenceDate.text=dateString;
    
    self.item.title=self.title;
    
//    self.MainNavigationBar
    
    NSLog(@"Jamal");
    
    
    
}

-(IBAction)saveInformation:(id)sender
{


   aDel=(AppDelegate *)[[UIApplication sharedApplication ] delegate];
    ExpenceInfo *currentInfo =(ExpenceInfo *)[NSEntityDescription insertNewObjectForEntityForName:@"Trasaction" inManagedObjectContext:aDel.managedObjectContext];
    
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *myNumber = [f numberFromString:self.expenseAmount.text];
    currentInfo.amount=myNumber;
    
    
    
    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//   
//    //[dateFormatter setTimeStyle:NSDateFormatterNoStyle];
//    [dateFormatter setDateFormat:@"dd-MMM-yy"];
//    NSDate *dateFromString = [dateFormatter dateFromString:string];
    
    
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [cal setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:1]]; // I'm in Paris (+1)
    NSDateComponents *comps = [cal components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:expDate];
    
    comps.hour = 0;
    comps.minute = 0;
    comps.second = 0;
    
    NSDate *newDate = [cal dateFromComponents:comps ];
    
//    NSLog(@"date: %@",newDate);
    
//    NSLog(@"%@",dateFromString);

    
    
    currentInfo.date=newDate;
    currentInfo.reason=self.expenceReason.text;
    currentInfo.discription=self.expenseDiscription.text;
    if([self.title isEqualToString:@"Expense"])
    {
    
        currentInfo.type=[NSNumber numberWithInt:1];
    }
    else if([self.title isEqualToString:@"Saving"])
    {
        currentInfo.type=[NSNumber numberWithInt:2];
    
    }
    else
    {
        currentInfo.type=[NSNumber numberWithInt:3];

    }
    
    [aDel.managedObjectContext save:nil];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Save"
                                                    message:@"Data Saved!"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
    self.expenseAmount.text=@"";
    self.expenceReason.text=@"";
    self.expenceDate.text=@"";
    self.expenseDiscription.text=@"";

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(IBAction)cancelExpence:(id)sender
{

    [self dismissModalViewControllerAnimated:YES];

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
