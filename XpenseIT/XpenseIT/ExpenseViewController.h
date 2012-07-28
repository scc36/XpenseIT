//
//  ExpenseViewController.h
//  XpenseIT
//
//  Created by briansj on 7/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpenseViewController : UITableViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSMutableArray *expenseListData;

- (void)readDataForTable;

@end
