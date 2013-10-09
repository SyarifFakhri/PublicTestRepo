//
//  AAFirstViewController.h
//  XIBTest
//
//  Created by Syarif on 10/9/13.
//  Copyright (c) 2013 A&A. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AAFirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *teamBoardTable;
- (IBAction)AddBoardBtn:(id)sender;
@end
