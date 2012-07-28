//
//  Expense.h
//  XpenseIT
//
//  Created by briansj on 7/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Config, Trip;

@interface Expense : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSDecimalNumber * rate;
@property (nonatomic, retain) NSDecimalNumber * qty;
@property (nonatomic, retain) NSDecimalNumber * cost;
@property (nonatomic, retain) NSData * picture;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) Trip *trip;
@property (nonatomic, retain) Config *config;

@end
