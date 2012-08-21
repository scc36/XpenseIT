//
//  TripViewDetail.m
//  XpenseIT
//
//  Created by briansj on 8/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TripViewDetail.h"

@interface TripViewDetail ()

@end

@implementation TripViewDetail

@synthesize managedObjectContext;
@synthesize currentTrip;
@synthesize date_startF, date_endF, titleF, descF;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (currentTrip)
    {
        [date_startF setDate:[currentTrip date_start]];
        [date_endF setDate:[currentTrip date_end]];
        [titleF setText:[currentTrip title]];
        [descF setText:[currentTrip desc]];
    }
}

#pragma mark - Button actions

- (IBAction)editSaveButtonPressed:(id)sender
{
    // If we are adding a new picture (because we didnt pass one from the table) then create an entry
    if (!currentTrip)
        self.currentTrip = (Trip *)[NSEntityDescription insertNewObjectForEntityForName:@"Trip" inManagedObjectContext:self.managedObjectContext];
    
    // For both new and existing pictures, fill in the details from the form
    [self.currentTrip setDate_start:[date_startF date]];
    [self.currentTrip setDate_end:[date_endF date]];
    [self.currentTrip setTitle:[titleF text]];
    [self.currentTrip setDesc:[descF text]];
    
    //  Commit item to core data
    NSError *error;
    if (![self.managedObjectContext save:&error])
        NSLog(@"Some error: %@", [error domain]);
    
    //  Automatically pop to previous view now we're done adding
    [self.navigationController popViewControllerAnimated:YES];
}

//  Resign the keyboard after Done is pressed when editing text fields
- (IBAction)resignKeyboard:(id)sender
{
    [sender resignFirstResponder];
}

@end
