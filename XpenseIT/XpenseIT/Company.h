//
//  Company.h
//  XpenseIT
//
//  Created by briansj on 7/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Company : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * address1;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * address2;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSNumber * zip;
@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSString * admin;
@property (nonatomic, retain) NSString * subscription;

@end
