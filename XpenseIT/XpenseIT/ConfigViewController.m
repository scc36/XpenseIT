//
//  ConfigViewController.m
//  XpenseIT
//
//  Created by briansj on 7/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ConfigViewController.h"
#import "DataHelper.h"

@interface ConfigViewController ()

@end

@implementation ConfigViewController

//  Synthesize accessors
@synthesize managedObjectContext, userF, nameF, departmentF, titleF, phoneF;

// Saving configuration information
- (IBAction)SaveInfo:(id)sender
{
    //  Get a reference to the text field on which the done button was pressed
    UITextField *tf = (UITextField *)sender;
    
    // Autojump logic between form fields
    //  Jump order progresses from top to bottom
    switch (tf.tag) {
        case 1:
            [nameF becomeFirstResponder];
            break;
        case 2:
            [departmentF becomeFirstResponder];
            break;
        case 3:
            [titleF becomeFirstResponder];
            break;
        case 4:
            [phoneF becomeFirstResponder];
            break;
        default:
            //  First put away the keyboard
            [sender resignFirstResponder];
            
            [self performSegueWithIdentifier:@"ConfigSegue" sender:sender];
            
            //  Set up a predicate (or search criteria) for checking the username and password
            NSPredicate *pred = [NSPredicate predicateWithFormat:@"(user == %@ && name == %@ && department = %@ && title = %@ && phone = %@)", [userF text], [nameF text], [departmentF text], [titleF text], [phoneF text]];
            
            // ******
            // This section attempts to match all fields in the model
            // CHANGE this to match only the user id
            
            //  Actually run the query in Core Data and return the count of found users with these details
            //  Obviously if it found ANY then we got the username and password right!
            if ([DataHelper countForEntity:@"Config" withPredicate:pred andContext:managedObjectContext] > 0)
                
                //  We found a matching login user!  Force the segue transition to the next view
                [self performSegueWithIdentifier:@"ConfigSegue" sender:sender];
            
            // ******
        }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
