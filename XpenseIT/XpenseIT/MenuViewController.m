//
//  MenuViewController.m
//  XpenseIT
//
//  Created by briansj on 7/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MenuViewController.h"
#import "DataHelper.h"
#import "ExpenseViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

//  Synthesize accessors
@synthesize managedObjectContext;

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

//TEMP
//  When we have logged in successfully, we need to pass the managed object context to our table view (via the navigation controller)
//  so we get a reference to the navigation controller first, then get the last controller in the nav stack, and pass the MOC to it
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //  THIS IS INCOMPATIBLE WITH CONFIGURATION BUTTON, CHANGE
    UINavigationController *navController = (UINavigationController *)[segue destinationViewController];
    ExpenseViewController *expenselist = (ExpenseViewController *)[[navController viewControllers] lastObject];
    expenselist.managedObjectContext = managedObjectContext;
}

@end
