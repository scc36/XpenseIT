//
//  TripViewDetail.h
//  XpenseIT
//
//  Created by briansj on 8/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Trip.h"

@interface TripViewDetail : UITableViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) Trip *currentTrip;

@property (strong, nonatomic) IBOutlet UIDatePicker *date_startF;
@property (strong, nonatomic) IBOutlet UIDatePicker *date_endF;
@property (strong, nonatomic) IBOutlet UITextField *titleF;
@property (strong, nonatomic) IBOutlet UITextField *descF;

@end
