//
//  CarsTableViewController.h
//  iOSLearning
//
//  Created by Yessica Miguel on 25/04/17.
//  Copyright © 2017 Yessica Miguel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryNotesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIToolbarDelegate>
@property NSMutableArray * notes;
@property NSString * vctitle;

@property (weak, nonatomic) IBOutlet UITableView *tvNotes;
@property (weak, nonatomic) IBOutlet UIToolbar *barBottom;


@end


