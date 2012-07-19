//
//  DataViewController.h
//  XpenseIT
//
//  Created by briansj on 7/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface DataViewController : UIViewController
    <UIImagePickerControllerDelegate, 
    UINavigationControllerDelegate>
    {
        UIImageView *imageView;
        BOOL newMedia;
    }

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id dataObject;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
- (IBAction)useCamera;
- (IBAction)useCameraRoll;
@end