//
//  SignUpViewController.m
//  MyMoney
//
//  Created by Parag Dulam on 09/01/16.
//  Copyright © 2016 Parag Dulam. All rights reserved.
//

#import "CalendarViewController.h"
#import <ABCalendarPicker/ABCalendarPicker.h>
#import "ExpenseViewController.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "ExpenceInfo.h"

@interface CalendarViewController ()<ABCalendarPickerDelegateProtocol,UITableViewDataSource>


@property (strong) NSMutableArray *data;






@end

@implementation CalendarViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  //  self.navigationItem.rightBarButtonItem.enabled=YES;
    
//    
//   
//    NSArray *views=  [[NSBundle mainBundle] loadNibNamed:@"Calendar" owner:nil options:nil];
//    picker=views[0];
//    picker.delegate=self;
//    
//    
//    [self.view addSubview:picker];
//    
    
   // picker=[ABCalendarPicker alloc];
   // picker=[self.view].calendarPicker;


    self.myView.delegate=self;
    [self.segmentControlView setSelectedSegmentIndex:0];
    self.trasactionType=@"Expense";
  //  [self.expenceTableView flashScrollIndicators];

    
    self.expenceTableView.showsVerticalScrollIndicator = YES;
    
    [self.expenceTableView flashScrollIndicators];
    
    [self.expenceTableView setScrollEnabled:YES];
    [self.expenceTableView setBounces:YES];
    
    //self.a=@"Expense";
    
    
    
}


-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
//    [self.calendarPicker layoutIfNeeded];
    
      [self.calendarPicker updateStateAnimated:YES];

}

- (void)viewDidAppear:(BOOL)animated
{
    //self.navigationItem.rightBarButtonItem.enabled=NO;
    self.myView.delegate=self;
    self.data=0;

    [self.expenceTableView reloadData];


}



-(IBAction)showDate:(id)sender
{
   
  //  NSLog(picker.selectedDate);
    
    //   NSLog(@"%@",self.a);
    
//    NSLog(@"%@",dateString);
//    
//    ExpenseViewController *expenceView=[ExpenseViewController alloc];
//    This will not used while trasfering control from one vc to another vc
//    [expenceView passValue:dateString];
//   // [expenceView.expenceDate setValue:dateString forKey:nil];
//    expenceView=[self.storyboard instantiateViewControllerWithIdentifier:@"Expense"];
//    [self.navigationController pushViewController:expenceView animated:YES];
//    
//if([ self.a isEqualToString:@"Expense"])
//{
//    NSString *dateString = [NSDateFormatter localizedStringFromDate:self.myView.selectedDate
//                                                          dateStyle:NSDateFormatterShortStyle
//                                                          timeStyle:NSDateFormatterFullStyle];
    [self performSegueWithIdentifier:@"ModalExpenceViewSegue" sender:nil];
//}
    
}



-(IBAction)selectSegmented:(id)sender
{

    if(self.segmentControlView.selectedSegmentIndex==0)
    {
    self.trasactionType=@"Expense";
}
if(self.segmentControlView.selectedSegmentIndex==1)
{
    self.trasactionType=@"Saving";
}
if(self.segmentControlView.selectedSegmentIndex==2)
{
    self.trasactionType=@"Income";
}
    
    [self updateTableView];


}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   
    
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"ModalExpenceViewSegue"])
    {
        ExpenseViewController *vc=[segue destinationViewController];
        [vc setExpDate:self.myView.highlightedDate];
        
       
if([self.trasactionType isEqualToString:@"Expense"])
{
    
    [vc setTitle:@"Expense"];
    
}
    else if([self.trasactionType isEqualToString:@"Income"])
        {
            [vc setTitle:@"Income"];
            
            
        }
        else
        {
            [vc setTitle:@"Saving"];
        }

}
}


-(void)updateTableView
{
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [cal setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:1]]; // I'm in Paris (+1)
    NSDateComponents *comps = [cal components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:self.myView.highlightedDate];
    
    comps.hour = 0;
    comps.minute = 0;
    comps.second = 0;
    NSDate *newDate = [cal dateFromComponents:comps ];
    AppDelegate *aDel=(AppDelegate *)[[UIApplication sharedApplication ] delegate];
    NSFetchRequest *req=[[NSFetchRequest alloc] initWithEntityName:@"Trasaction"];
    if([self.trasactionType isEqualToString:@"Expense"])
    {
        
        
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"date == %@ ",newDate];
        
        
        //[req setPredicate:[NSPredicate predicateWithFormat:@"date == %@",self.myView.selectedDate]];
        [req setPredicate:predicate];
        
        // self.navigationItem.rightBarButtonItem.enabled=YES;
    }
    
    if([self.trasactionType isEqualToString:@"Saving"])
    {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"date == %@ and type==2",newDate];
        
        
        //[req setPredicate:[NSPredicate predicateWithFormat:@"date == %@",self.myView.selectedDate]];
        [req setPredicate:predicate];
        
    }
    
    if([self.trasactionType isEqualToString:@"Income"])
    {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"date == %@ and type==3",newDate];
        
        
        //[req setPredicate:[NSPredicate predicateWithFormat:@"date == %@",self.myView.selectedDate]];
        [req setPredicate:predicate];
        
        
    }
    
    self.data=[[aDel.managedObjectContext executeFetchRequest:req error:nil] mutableCopy];
    [self.expenceTableView reloadData];



}

- (void)calendarPicker:(ABCalendarPicker*)calendarPicker
          dateSelected:(NSDate*)date
             withState:(ABCalendarPickerState)state
{

    [self updateTableView];
    
}

- (void)calendarPicker:(ABCalendarPicker*)calendarPicker
           didSetState:(ABCalendarPickerState)state
             fromState:(ABCalendarPickerState)fromState
{

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
  ExpenceInfo *info  =[self.data objectAtIndex:indexPath.row];
  NSString *you = [NSString stringWithFormat:@"%@ %@ %@ %@",info.reason,info.amount,info.discription,info.type];
    cell.textLabel.text=you;
    return cell;

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
