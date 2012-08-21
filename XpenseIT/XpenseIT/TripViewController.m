//
//  TripViewController.m
//  XpenseIT
//
//  Created by briansj on 8/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TripViewController.h"
#import "TripViewDetail.h"
#import "DataHelper.h"
#import "Trip.h"

@interface TripViewController ()

@end

@implementation TripViewController

@synthesize managedObjectContext, tripListData;

//  When the view reappears, read new data for table
- (void)viewWillAppear:(BOOL)animated
{
    //  Repopulate the array with new table data
    [self readDataForTable];
}

//  Grab data for table - this will be used whenever the list appears or reappears after an add/edit
- (void)readDataForTable
{
    //  Grab the data
    tripListData = [DataHelper getObjectsForEntity:@"Trip" withSortKey:@"date_start" andSortAscending:YES andContext:managedObjectContext];
    
    //  Force table refresh
    [self.tableView reloadData];
}

#pragma mark - Actions

//  Button to log out of app (dismiss the modal view!)
- (IBAction)menuButtonPressed:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - Table view data source

//  Return the number of sections in the table
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//  Return the number of rows in the section (the amount of items in our array)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tripListData count];
}

//  Create / reuse a table cell and configure it for display
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TripCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Get the core data object we need to use to populate this table cell
    Trip *currentCell = [tripListData objectAtIndex:indexPath.row];
    
    //  Fill in the cell contents
    // Convert date to string
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM-dd-yy"];
    cell.textLabel.text = [dateFormat stringFromDate:[currentCell date_start]];
    cell.detailTextLabel.text = currentCell.title;
    
    return cell;
}

//  Swipe to delete has been used.  Remove the table item
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        //  Get a reference to the table item in our data array
        Trip *itemToDelete = [self.tripListData objectAtIndex:indexPath.row];
        
        //  Delete the item in Core Data
        [self.managedObjectContext deleteObject:itemToDelete];
        
        //  Remove the item from our array
        [tripListData removeObjectAtIndex:indexPath.row];
        
        //  Commit the deletion in core data
        NSError *error;
        if (![self.managedObjectContext save:&error])
            NSLog(@"Failed to delete picture item with error: %@", [error domain]);
        
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//  When add is pressed or a table row is selected
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //  Get a reference to our detail view
    TripViewDetail *pld = (TripViewDetail *)[segue destinationViewController];
    
    //  Pass the managed object context to the destination view controller
    pld.managedObjectContext = managedObjectContext;
    
    //  If we are editing a picture we need to pass some stuff, so check the segue title first
    if ([[segue identifier] isEqualToString:@"EditTrip"])
    {
        //  Get the row we selected to view
        NSInteger selectedIndex = [[self.tableView indexPathForSelectedRow] row];
        
        //  Pass the picture object from the table that we want to view
        pld.currentTrip = [tripListData objectAtIndex:selectedIndex];
    }
}

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    return cell;
}
*/
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
