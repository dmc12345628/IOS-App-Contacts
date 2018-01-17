//
//  EditInfoViewController.h
//  IOS-SQLITE-TP-02
//
//  Created by local192 on 17/01/2018.
//  Copyright © 2018 local192. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditInfoViewController : UIViewController

// outlets
@property (weak, nonatomic) IBOutlet UITextField *txtFirstname;
@property (weak, nonatomic) IBOutlet UITextField *txtLasname;
@property (weak, nonatomic) IBOutlet UITextField *txtAge;

// methods
- (IBAction)saveInfo:(id)sender;

@end
