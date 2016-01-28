//
//  ViewController.h
//  MyMoney
//
//  Created by Parag Dulam on 08/01/16.
//  Copyright (c) 2016 Parag Dulam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


-(IBAction)login:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;


@end

