//
//  ViewController.h
//  IOS-SQLITE-TP-02
//
//  Created by local192 on 17/01/2018.
//  Copyright © 2018 local192. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *tblPeople;
- (IBAction)addNewRecord:(id)sender;

@end

