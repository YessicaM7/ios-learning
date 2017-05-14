//
//  DetailNoteTableViewController.h
//  iOSLearning
//
//  Created by Yessica Miguel on 07/05/17.
//  Copyright © 2017 Yessica Miguel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailNoteViewController : UIViewController <UITextViewDelegate>

@property NSString * note;
@property NSString * arrayImages;


@property (weak, nonatomic) IBOutlet UITextView *txtNote;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *txtNoteHeightConstraint;

@end
