//
//  EditInfoViewController.h
//  IOS-SQLITE-TP-02
//
//  Created by local192 on 17/01/2018.
//  Copyright © 2018 local192. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@protocol EditInfoViewControllerDelegate

- (void) editingInfoWasFinished;

@end

@interface EditInfoViewController : UIViewController<UITextFieldDelegate>

// outlets
@property (weak, nonatomic) IBOutlet UITextField *txtFirstname;
@property (weak, nonatomic) IBOutlet UITextField *txtLastname;
@property (weak, nonatomic) IBOutlet UITextField *txtAge;

@property (nonatomic, readonly, strong) DBManager *dbManager;

@property (nonatomic, strong) id<EditInfoViewControllerDelegate> delegate;

// methods
- (IBAction)saveInfo:(id)sender;

@end

@interface EditInfoViewController()

@property (nonatomic, readwrite, strong) DBManager *dbManager;

@end
