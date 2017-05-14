//
//  WelcomeViewController.m
//  iOSLearning
//
//  Created by Yessica Miguel on 25/04/17.
//  Copyright © 2017 Yessica Miguel. All rights reserved.
//

#import "NotesTableViewController.h"
#import "NoteResumeTableViewCell.h"
#import "CategoryNotesViewController.h"

@interface NotesTableViewController (){
    NSMutableArray * data;
}

@end

@implementation NotesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    self.navigationItem.title = @"Todas las notas";
    self.tableView.rowHeight = 40;
    self.tableView.estimatedRowHeight = 40;
    self.tableView.sectionHeaderHeight = 50;
    
    [self loadData];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray * notes = [[data objectAtIndex:section] objectForKey:@"notes"];
    return notes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellIdentifier = @"SummaryNoteCell";
    
    NoteResumeTableViewCell * cell = (NoteResumeTableViewCell * ) [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        NSArray * nib = [[NSBundle mainBundle]
                         loadNibNamed:@"NoteResumeTableViewCell"
                         owner:cell
                         options:kNilOptions];
        cell = [nib objectAtIndex:0];
    }
    
    NSArray * notes = [[data objectAtIndex:indexPath.section] objectForKey:@"notes"];
    NSString * item = [notes objectAtIndex:indexPath.row];
    cell.txtTitle.font = [cell.textLabel.font fontWithSize:13];
    
    if([item length] > 0){
        cell.txtTitle.text = item;
    }
    
    cell.txtNumber.text = [NSString stringWithFormat:@"%ld", (unsigned long)notes.count];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"segueCategoryNotes" sender:indexPath];
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [[data objectAtIndex:section] valueForKey:@"title"];

}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"segueCategoryNotes"]){
        NSIndexPath * selectedElement = sender;
        
        CategoryNotesViewController * vc = (CategoryNotesViewController *)[segue destinationViewController];
        vc.vctitle = [[data objectAtIndex:selectedElement.section] valueForKey:@"title"];
        vc.notes = [[data objectAtIndex:selectedElement.section] valueForKey:@"notes"];
    }
}

- (IBAction)toTable:(id)sender {
    [self performSegueWithIdentifier:@"segueTable" sender:nil];
}


-(void) loadData{
    NSString * jsonPath = [[NSBundle mainBundle] pathForResource:@"notes" ofType:@"json"];
    NSString * json = [[NSString alloc] initWithContentsOfFile:jsonPath encoding:NSUTF8StringEncoding error:NULL];
    NSError * error = nil;
    
    NSArray * jsonArray = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    
    
    if(jsonArray)
        data = [jsonArray mutableCopy];
    else
        data = [NSMutableArray new];
    
    [self.tableView reloadData];
}

@end
