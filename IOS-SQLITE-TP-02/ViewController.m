//
//  ViewController.m
//  IOS-SQLITE-TP-02
//
//  Created by local192 on 17/01/2018.
//  Copyright © 2018 local192. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tblPeople.delegate = self;
    self.tblPeople.dataSource = self;
    
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"sampledb.db"];
    
    //NSString *query = @"select * from peaopleInfo";
    
    //Get the results
    /*if(self.arrPeopleInfo != nil){
        
        self.arrPeopleInfo = nil;
    }*/
    
    //self.arrPeopleInfo = [[NSArray alloc]initWithArray:[self.dbManagerloadDataFormDB:query]];
    
    //reload the table view
    [self.tblPeople reloadData];
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// actions
- (IBAction)addNewRecord:(id)sender {
    [self performSegueWithIdentifier:@"idSegueEditInfo" sender:self];
}

- (void) loadData {
    NSString *query = @"select * from peopleInfo";
    
    if (self.arrPeopleInfo != nil) {
        self.arrPeopleInfo = nil;
    }
    
    self.arrPeopleInfo = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    
    [self.tblPeople reloadData];
}

- (void) editingInfoWasFinished {
    [self loadData];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    EditInfoViewController *editInfoViewController = [segue destinationViewController];
    editInfoViewController.delegate = self;
}

// table view methods
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrPeopleInfo.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idCellRecord" forIndexPath:indexPath];
    
    NSInteger indexOfFirstname = [self.dbManager.arrColumnNames indexOfObject:@"firstname"];
    NSInteger indexOfLastname = [self.dbManager.arrColumnNames indexOfObject:@"lastname"];
    NSInteger indexOfAge = [self.dbManager.arrColumnNames indexOfObject:@"age"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",
                           [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfFirstname],
                           [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfLastname]];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Age : %@",
                                 [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfAge]];
    
    return cell;
}
@end
