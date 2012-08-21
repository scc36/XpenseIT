//
//  ConfigViewController.h
//  XpenseIT
//
//  Created by briansj on 7/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Config.h"

@interface ConfigViewController : UIViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSMutableArray *configListData;
@property (strong, nonatomic) Config *currentConfig;

@property (strong, nonatomic) IBOutlet UITextField *userF;
@property (strong, nonatomic) IBOutlet UITextField *nameF;
@property (strong, nonatomic) IBOutlet UITextField *departmentF;
@property (strong, nonatomic) IBOutlet UITextField *titleF;
@property (strong, nonatomic) IBOutlet UITextField *phoneF;

//@property (nonatomic, retain) NSDecimalNumber * business_miles;
//@property (nonatomic, retain) Company *company;
//@property (nonatomic, retain) Trip *current_trip;

@end
