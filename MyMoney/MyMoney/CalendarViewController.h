//
//  SignUpViewController.h
//  MyMoney
//
//  Created by Parag Dulam on 09/01/16.
//  Copyright © 2016 Parag Dulam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ABCalendarPicker/ABCalendarPicker.h>


@interface CalendarViewController : UIViewController
@property (strong, nonatomic) IBOutlet ABCalendarPicker *myView;
@property (strong, nonatomic) IBOutletCollection(UIBarButtonItem) NSArray *addButton;

-(IBAction)showDate:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *expenceTableView;

@property (weak, nonatomic) IBOutlet ABCalendarPicker *calendarPicker;

@property (weak,nonatomic) NSString *trasactionType;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControlView;



@end
