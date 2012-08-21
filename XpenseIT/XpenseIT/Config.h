//
//  Config.h
//  XpenseIT
//
//  Created by briansj on 8/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Company, Expense, Trip;

@interface Config : NSManagedObject

@property (nonatomic, retain) NSDecimalNumber * business_miles;
@property (nonatomic, retain) NSString * department;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * user;
@property (nonatomic, retain) Trip *current_trip;
@property (nonatomic, retain) NSOrderedSet *trips;
@property (nonatomic, retain) NSOrderedSet *expenses;
@property (nonatomic, retain) Company *company;
@end

@interface Config (CoreDataGeneratedAccessors)

- (void)insertObject:(Trip *)value inTripsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromTripsAtIndex:(NSUInteger)idx;
- (void)insertTrips:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeTripsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInTripsAtIndex:(NSUInteger)idx withObject:(Trip *)value;
- (void)replaceTripsAtIndexes:(NSIndexSet *)indexes withTrips:(NSArray *)values;
- (void)addTripsObject:(Trip *)value;
- (void)removeTripsObject:(Trip *)value;
- (void)addTrips:(NSOrderedSet *)values;
- (void)removeTrips:(NSOrderedSet *)values;
- (void)insertObject:(Expense *)value inExpensesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromExpensesAtIndex:(NSUInteger)idx;
- (void)insertExpenses:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeExpensesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInExpensesAtIndex:(NSUInteger)idx withObject:(Expense *)value;
- (void)replaceExpensesAtIndexes:(NSIndexSet *)indexes withExpenses:(NSArray *)values;
- (void)addExpensesObject:(Expense *)value;
- (void)removeExpensesObject:(Expense *)value;
- (void)addExpenses:(NSOrderedSet *)values;
- (void)removeExpenses:(NSOrderedSet *)values;
@end
