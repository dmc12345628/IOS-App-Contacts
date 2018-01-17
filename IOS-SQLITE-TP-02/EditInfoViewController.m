//
//  EditInfoViewController.m
//  IOS-SQLITE-TP-02
//
//  Created by local192 on 17/01/2018.
//  Copyright © 2018 local192. All rights reserved.
//

#import "EditInfoViewController.h"

@implementation EditInfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = self.navigationItem.rightBarButtonItem.tintColor;
    
    self.txtFirstname.delegate = self;
    self.txtLastname.delegate = self;
    self.txtAge.delegate = self;
    
    self.dbManager=[[DBManager alloc] initWithDatabaseFilename:@"sampledb.db"];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)saveInfo:(id)sender {
    NSString *query = [NSString stringWithFormat:@"insert into peopleInfo values (null, '%@', '%@', %d)",
                       self.txtFirstname.text, self.txtLastname.text, [self.txtAge.text intValue]];
    
    [self.dbManager executeQuery:query];
    
    if(self.dbManager.affectedRows != 0) {
        NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);

        [self.delegate editingInfoWasFinished];
        
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        NSLog(@"Could not execute the query.");
    }
}
@end
