//
//  Config.h
//  XpenseIT
//
//  Created by briansj on 7/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Company, Trip;

@interface Config : NSManagedObject

@property (nonatomic, retain) NSDecimalNumber * business_miles;
@property (nonatomic, retain) NSString * department;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * phone;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * user;
@property (nonatomic, retain) Company *company;
@property (nonatomic, retain) Trip *current_trip;

@end
