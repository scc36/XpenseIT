//
//  Trip.h
//  XpenseIT
//
//  Created by briansj on 8/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Config, Expense;

@interface Trip : NSManagedObject

@property (nonatomic, retain) NSDate * date_end;
@property (nonatomic, retain) NSDate * date_start;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet *expenses;
@property (nonatomic, retain) Config *owner;
@property (nonatomic, retain) Config *selected;
@end

@interface Trip (CoreDataGeneratedAccessors)

- (void)addExpensesObject:(Expense *)value;
- (void)removeExpensesObject:(Expense *)value;
- (void)addExpenses:(NSSet *)values;
- (void)removeExpenses:(NSSet *)values;

@end
