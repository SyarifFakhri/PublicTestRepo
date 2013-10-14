//
//  AAFirstViewController.h
//  XIBTest
//
//  Created by Syarif on 10/9/13.
//  Copyright (c) 2013 A&A. All rights reserved.

#import <UIKit/UIKit.h>
#import "AABoardViewController.h"
#import "LBSettingsViewController.h"
#import "LBAppDelegate.h"

@interface AAFirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *teamBoardTable;

- (IBAction)settingsBtn:(id)sender;

- (IBAction)addBoardBtn:(id)sender;

//- (IBAction)AddBoardBtn:(id)sender;

@end
