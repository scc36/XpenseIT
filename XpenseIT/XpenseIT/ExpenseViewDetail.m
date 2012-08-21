//
//  ExpenseViewDetail.m
//  XpenseIT
//
//  Created by briansj on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ExpenseViewDetail.h"

@interface ExpenseViewDetail ()

@end

@implementation ExpenseViewDetail

@synthesize managedObjectContext;
@synthesize currentExpense;
@synthesize dateF, rateF, qtyF, costF, descF, pictureF;
@synthesize imagePicker;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // If we are editing an existing picture, then put the details from Core Data into the text fields for displaying
    if (currentExpense)
    {
        [dateF setDate:[currentExpense date]];
        [rateF setText:[NSString stringWithFormat:@"%d", currentExpense.rate]];
        [qtyF setText:[NSString stringWithFormat:@"%d", currentExpense.qty]];
        [costF setText:[NSString stringWithFormat:@"%d", currentExpense.cost]];
        [descF setText:[currentExpense desc]];
        if ([currentExpense picture])
            [pictureF setImage:[UIImage imageWithData:[currentExpense picture]]];
    }
}

#pragma mark - Button actions

- (IBAction)editSaveButtonPressed:(id)sender
{
    // If we are adding a new picture (because we didnt pass one from the table) then create an entry
    if (!currentExpense)
        self.currentExpense = (Expense *)[NSEntityDescription insertNewObjectForEntityForName:@"Expense" inManagedObjectContext:self.managedObjectContext];
    
    // For both new and existing pictures, fill in the details from the form
    [self.currentExpense setDate:[dateF date]];
//consider replacing with NSDecimal CPDecimalFromString    
    [self.currentExpense setRate:[NSDecimalNumber decimalNumberWithString: rateF.text]];
    [self.currentExpense setQty:[NSDecimalNumber decimalNumberWithString: qtyF.text]];
    [self.currentExpense setCost:[NSDecimalNumber decimalNumberWithString: costF.text]];
    [self.currentExpense setDesc:[descF text]];
    
    NSLog(@"saved");
    
    if (pictureF.image)
    {
        // Resize and save a smaller version for the table
        float resize = 100.0;
        float actualWidth = pictureF.image.size.width;
        float actualHeight = pictureF.image.size.height;
        float divBy, newWidth, newHeight;
        if (actualWidth > actualHeight) {
            divBy = (actualWidth / resize);
            newWidth = resize;
            newHeight = (actualHeight / divBy);
        } else {
            divBy = (actualHeight / resize);
            newWidth = (actualWidth / divBy);
            newHeight = resize;
        }
        CGRect rect = CGRectMake(0.0, 0.0, newWidth, newHeight);
        UIGraphicsBeginImageContext(rect.size);
        [pictureF.image drawInRect:rect];
        UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        // Save the small image version
        NSData *smallImageData = UIImageJPEGRepresentation(smallImage, 1.0);
        [self.currentExpense setPicture:smallImageData];
    }
    
    //  Commit item to core data
    NSError *error;
    if (![self.managedObjectContext save:&error])
        NSLog(@"Failed to add new picture with error: %@", [error domain]);
    
    //  Automatically pop to previous view now we're done adding
    [self.navigationController popViewControllerAnimated:YES];
}

//  Take an image with camera
- (IBAction)imageFromCamera:(id)sender
{
    imagePicker = [[UIImagePickerController alloc] init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
        //imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    }
    else
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    [imagePicker setDelegate:self];
    [self presentViewController:imagePicker animated:YES completion:nil];
    //[self presentModalViewController:imagePicker animated:YES];
}

//  Resign the keyboard after Done is pressed when editing text fields
- (IBAction)resignKeyboard:(id)sender
{
    [sender resignFirstResponder];
}

#pragma mark - Image Picker Delegate Methods

//  Dismiss the image picker on selection and use the resulting image in our ImageView
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    [imagePicker dismissModalViewControllerAnimated:YES];
    [pictureF setImage:image];
}

//  On cancel, only dismiss the picker controller
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [imagePicker dismissModalViewControllerAnimated:YES];
}

/* ORIGINAL CODE
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

#pragma mark - Table view data source

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
/*
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     
}*/

@end
