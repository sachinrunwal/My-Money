//
//  ViewController.m
//  MyMoney
//
//  Created by Parag Dulam on 08/01/16.
//  Copyright (c) 2016 Parag Dulam. All rights reserved.
//

#import "ViewController.h"

#import "CalendarViewController.h"
#import "LoginDetails.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"


@interface ViewController ()
@property (strong) NSMutableArray *user;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    

//     NSFetchRequest *req=[[NSFetchRequest alloc] initWithEntityName:@"LoginDetails"];
//     self.user=[[aDel.managedObjectContext executeFetchRequest:req error:nil] mutableCopy];
//    
//    if(self.user.count>0)
//    {
//        LoginViewController *log=[LoginViewController alloc];
//        log=[self.storyboard instantiateViewControllerWithIdentifier:@"Login"];
//        [self presentViewController:log animated:YES completion:^{
//        
//        }];
    
      // UIApplication.sharedApplication().keyWindow.rootViewController = log;
     //[self performSegueWithIdentifier:@"Login" sender:self];
        
        
        
        
//    }
//    else
//    {
//    
//    }
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)login:(id)sender
{

    
    AppDelegate *aDel=(AppDelegate *)[[UIApplication sharedApplication ] delegate];
    LoginDetails *firstUser =(LoginDetails *)[NSEntityDescription insertNewObjectForEntityForName:@"LoginDetails" inManagedObjectContext:aDel.managedObjectContext];
    firstUser.useName=self.userName.text;
    firstUser.firstName=self.firstName.text;
    firstUser.password=self.password.text;
    [aDel.managedObjectContext save:nil];
    
    [aDel setCategoriesView];
    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Save"
//                                                    message:@"Login Successfully"
//                                                   delegate:self
//                                          cancelButtonTitle:@"OK"
//                                          otherButtonTitles:nil];
//    [alert show];
//    
//    
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//          UINavigationController *categoriesNavController = (UINavigationController *)[storyboard instantiateViewControllerWithIdentifier:@"CalendarNac"];
//    
    
//    //        [categoriesNavController.navigationController setNavigationBarHidden:NO animated:YES];
    //[self.window setRootViewController:categoriesNavController];
    //
    

    
//    NSLog(@"save");
    
//    LoginViewController *log=[LoginViewController alloc];
//    log=[self.storyboard instantiateViewControllerWithIdentifier:@"Login"];
//    //[self presentViewController:log animated:YES completion:^{
    
    //}];
    
//    [self.navigationController pushViewController:log animated:YES];
        
}

//-(IBAction)signUp:(id)sender
//{
//
//    SignUpViewController *log=[SignUpViewController alloc];
//    log=[self.storyboard instantiateViewControllerWithIdentifier:@"SignUp"];
//  //  [self presentViewController:log animated:YES completion:^{}];
//
//    [self.navigationController pushViewController:log animated:YES];
//}

@end
