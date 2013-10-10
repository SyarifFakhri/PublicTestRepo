//
//  AAFirstViewController.m
//  XIBTest
//
//  Created by Syarif on 10/9/13.
//  Copyright (c) 2013 A&A. All rights reserved.
//

#import "AAFirstViewController.h"

@interface AAFirstViewController ()
@property (strong,nonatomic) NSMutableArray *teamBoardsArray;
@property int currentCount;
@property CGRect cellFrame;
@end

@implementation AAFirstViewController

@synthesize teamBoardsArray, teamBoardTable, currentCount,cellFrame;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationController.navigationBarHidden = YES;
    self.teamBoardTable.rowHeight = 50;
    self.teamBoardsArray = [NSMutableArray new];
    self.currentCount = 0;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return teamBoardsArray.count;
}


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *Identifier = @"cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    
    [cell.contentView addSubview:[teamBoardsArray objectAtIndex:(teamBoardsArray.count-1)]];
    
    return cell;
    
}

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Team Boards";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)AddBoardBtn:(id)sender
{
    CGSize tableview = teamBoardTable.contentSize;
    UITextField *tempTextField = [[UITextField alloc] initWithFrame:
                                  CGRectMake(0, 0, tableview.width, tableview.height)];
    tempTextField.delegate = self;
    
    [teamBoardsArray addObject:tempTextField];
    
    [teamBoardTable reloadData];

}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
