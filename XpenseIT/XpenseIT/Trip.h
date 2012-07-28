//
//  Trip.h
//  XpenseIT
//
//  Created by briansj on 7/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Trip : NSManagedObject

@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSDate * date_start;
@property (nonatomic, retain) NSString * date_end;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSManagedObject *config;

@end
