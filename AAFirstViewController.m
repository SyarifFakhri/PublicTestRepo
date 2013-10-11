//
//  AAFirstViewController.m
//  XIBTest
//
//  Created by Syarif on 10/9/13.
//  Copyright (c) 2013 A&A. All rights reserved.
//

#import "AAFirstViewController.h"

@interface AAFirstViewController ()
@property (strong,nonatomic) NSMutableArray *teamBoardsArray, *arrayBtns, *viewTag;
@property int currentCount;
@property CGRect cellFrame;
@end

@implementation AAFirstViewController

@synthesize teamBoardsArray, teamBoardTable, currentCount,cellFrame,arrayBtns;

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
    self.arrayBtns = [NSMutableArray new];
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
    
    [cell.contentView addSubview:[arrayBtns objectAtIndex:indexPath.row]];
    [cell.contentView addSubview:[teamBoardsArray objectAtIndex:indexPath.row]];
    
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
    //set the ui text field
    UITextField *tempTextField = [[UITextField alloc] initWithFrame:
                                  CGRectMake(0, 0, self.view.bounds.size.width - 70, 44)];
    tempTextField.delegate = self;
    tempTextField.textAlignment = NSTextAlignmentCenter;
    
    
    //add button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(245, 0, 75, 50);
    [button setTitle:@"Next" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(nextView) forControlEvents:UIControlEventTouchUpInside];
    
    [teamBoardsArray addObject:tempTextField];
    [arrayBtns addObject:button];
    
    [teamBoardTable reloadData];
    
    [tempTextField becomeFirstResponder];

}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField.text.length > 1) {
        return NO;
    }
    
    else {
        return YES;
    }
}

-(void) nextView
{
    NSLog(@"Button Clicked");
}



@end
