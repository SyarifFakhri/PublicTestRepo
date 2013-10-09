//
//  AAFirstViewController.m
//  XIBTest
//
//  Created by Syarif on 10/9/13.
//  Copyright (c) 2013 A&A. All rights reserved.
//

#import "AAFirstViewController.h"

@interface AAFirstViewController ()

- (IBAction)AddBoardBtn:(id)sender;

@property (strong,nonatomic) NSMutableArray *teamBoardsArray;
@property (strong,nonatomic) UITextField *inputTeamBoardName;
@property (strong,nonatomic) UITableViewCell *cell;
@property (strong, nonatomic) UITableView *teamBoardTable;

@end

@implementation AAFirstViewController
@synthesize teamBoardsArray,inputTeamBoardName,cell, teamBoardTable;

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
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden = YES;

    self.teamBoardsArray = [NSMutableArray new];
    
    self.inputTeamBoardName = [UITextField new];
    
    
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
    self.cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    
    NSString *string =  [teamBoardsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = string;
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

- (IBAction)AddBoardBtn:(id)sender {
    //int nextCell = teamBoardsArray.count;
    int currentFreeCell = teamBoardsArray.count;
    
    CGRect textFrame = cell.contentView.frame;
    
    self.inputTeamBoardName.frame = textFrame;
    self.inputTeamBoardName.text = @"test";
    self.inputTeamBoardName.backgroundColor = [UIColor grayColor];
    
    [[cell.contentView viewWithTag:currentFreeCell] addSubview:inputTeamBoardName];
    
    [inputTeamBoardName becomeFirstResponder];
    
    [teamBoardTable reloadData];
}
@end
