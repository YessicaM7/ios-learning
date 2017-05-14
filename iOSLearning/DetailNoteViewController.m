//
//  DetailNoteTableViewController.m
//  iOSLearning
//
//  Created by Yessica Miguel on 07/05/17.
//  Copyright © 2017 Yessica Miguel. All rights reserved.
//

#import "DetailNoteViewController.h"

@interface DetailNoteViewController ()

@end

@implementation DetailNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.topItem.title = @"";
    
    self.txtNote.scrollEnabled = NO;
    self.txtNote.text = self.note;
    self.txtNote.delegate = self;
    [self.txtNote sizeToFit];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)textViewDidChange:(UITextView *)textView
{
    [self.txtNote sizeToFit];
}

@end
