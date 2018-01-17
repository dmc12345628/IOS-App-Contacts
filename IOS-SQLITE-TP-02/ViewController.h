//
//  ViewController.h
//  IOS-SQLITE-TP-02
//
//  Created by local192 on 17/01/2018.
//  Copyright © 2018 local192. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"
#import "EditInfoViewController.h"

@interface ViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, EditInfoViewControllerDelegate>

// properties
@property (nonatomic, strong) DBManager *dbManager;
@property (nonatomic, strong) NSArray *arrPeopleInfo;

@property (strong, nonatomic) IBOutlet UITableView *tblPeople;

// actions
- (IBAction)addNewRecord:(id)sender;

// methods
-(void)loadData;

@end

