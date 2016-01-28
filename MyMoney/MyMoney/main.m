//
//  main.m
//  MyMoney
//
//  Created by Parag Dulam on 08/01/16.
//  Copyright (c) 2016 Parag Dulam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <ABCalendarPicker/ABCalendarPicker.h>

int main(int argc, char * argv[]) {
    @autoreleasepool {
        [ABCalendarPicker class];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        
    }
}
