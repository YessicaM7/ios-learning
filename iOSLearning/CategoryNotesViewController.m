//
//  CarsTableViewController.m
//  iOSLearning
//
//  Created by Yessica Miguel on 25/04/17.
//  Copyright © 2017 Yessica Miguel. All rights reserved.
//

#import "CategoryNotesViewController.h"
#import "DetailNoteViewController.h"

@interface CategoryNotesViewController ()

@end

@implementation CategoryNotesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tvNotes.delegate = self;
    self.tvNotes.dataSource = self;
    self.tvNotes.rowHeight = 60;
    self.tvNotes.estimatedRowHeight = 60;
    
    self.barBottom.delegate = self;
    
    self.navigationController.navigationBar.topItem.title = @"";
    self.navigationItem.title = self.vctitle;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.notes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * cellIdentifier = @"NoteCell";
    
    UITableViewCell *cell = [[UITableViewCell alloc]
                             initWithStyle:UITableViewCellStyleSubtitle
                             reuseIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleSubtitle
                 reuseIdentifier:cellIdentifier];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    NSDateFormatter * dateFormat = [NSDateFormatter new];
    [dateFormat setDateFormat:@"dd-MM-YYY"];
    /*
    NSDate * notedate = [dateFormat dateFromString:@"01-05-2017"];
     */
    
    cell.detailTextLabel.text = [dateFormat stringFromDate:[NSDate date]];
    NSString * item = [self.notes objectAtIndex:indexPath.row];
    
    if(item && ![item isKindOfClass:[NSNull class]]){
        cell.textLabel.text = item;
    }else{
        cell.textLabel.text = @"No value";
    }
    
    return cell;
}


/* MARK AS LIST
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cellCheck = [tableView
                                  cellForRowAtIndexPath:indexPath];
    cellCheck.accessoryType = cellCheck.accessoryType == UITableViewCellAccessoryNone ?  UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
}
 */

/* MARK AS LIST */
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     [self performSegueWithIdentifier:@"segueDetailNote" sender:indexPath];
 }



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/**/
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"segueDetailNote"]){
        NSIndexPath * selectedItem = (NSIndexPath *) sender;
        
        DetailNoteViewController * vc = [segue destinationViewController];
        vc.note = [self.notes objectAtIndex:selectedItem.row];
    }
}

-(void) loadData{
    /*
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:@"http://localhost:8888/data.php"]
            completionHandler:^(NSData *dataResult,
                                NSURLResponse *response,
                                NSError *error) {
            
                NSDictionary *jsonArray = [NSJSONSerialization JSONObjectWithData:dataResult options:kNilOptions error:&error];
                
                if (error != nil) {
                    NSLog(@"Error parsing JSON.");
                }
                else {
                    NSLog(@"Array: %@", jsonArray);
                    
                    data = [jsonArray valueForKeyPath:@"menu.items"];
                    
                    [self.tableView reloadData];
                }
                
            }] resume];
     
     */
    
    if(!self.notes)
        self.notes = [NSMutableArray new];
    [self.tvNotes reloadData];
    
}

- (IBAction)addNote:(id)sender {
    
}


@end
