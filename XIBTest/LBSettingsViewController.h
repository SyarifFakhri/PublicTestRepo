//
//  LBSettingsViewController.h
//  XIBTest
//
//  Created by Syarif on 10/12/13.
//  Copyright (c) 2013 A&A. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBSettingsViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

- (IBAction)boardBtn:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *settingsTable;
@property (strong, nonatomic) NSMutableArray *settingsArray;
@end
