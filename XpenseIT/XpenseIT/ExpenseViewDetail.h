//
//  ExpenseViewDetail.h
//  XpenseIT
//
//  Created by briansj on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Expense.h"

@interface ExpenseViewDetail : UITableViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) Expense *currentExpense;

@property (strong, nonatomic) IBOutlet UIDatePicker *dateF;
@property (strong, nonatomic) IBOutlet UITextField *rateF;
@property (strong, nonatomic) IBOutlet UITextField *qtyF;
@property (strong, nonatomic) IBOutlet UITextField *costF;
@property (strong, nonatomic) IBOutlet UITextField *descF;
@property (strong, nonatomic) IBOutlet UIImageView *pictureF;

@property (strong, nonatomic) UIImagePickerController *imagePicker;

@end
