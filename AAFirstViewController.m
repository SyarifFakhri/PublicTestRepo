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
@property LBAppDelegate *appDelegate;
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

    self.appDelegate = (LBAppDelegate*)[[UIApplication sharedApplication]delegate];

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
    
//    [cell.contentView addSubview:[arrayBtns objectAtIndex:indexPath.row]];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
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

//- (IBAction)AddBoardBtn:(id)sender
//{
//    //set the ui text field
//    UITextField *tempTextField = [[UITextField alloc] initWithFrame:
//                                  CGRectMake(0, 0, self.view.bounds.size.width - 70, 44)];
//    tempTextField.delegate = self;
//    tempTextField.textAlignment = NSTextAlignmentCenter;
//    
//    [teamBoardsArray addObject:tempTextField];
////    [arrayBtns addObject:button];
//    
//    [teamBoardTable reloadData];
//    
//    [tempTextField becomeFirstResponder];
//
//}


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

- (void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    //The current view is the int "currentBoardInt" This will then be used to call a 2 dimensional array.
    self.appDelegate.currentBoardInt = indexPath.row;
    NSLog(@"currentBoard:%d",self.appDelegate.currentBoardInt);
    
    AABoardViewController *viewController = [[AABoardViewController alloc] initWithNibName:@"AABoardViewController" bundle:nil] ;
    [self.navigationController pushViewController:viewController animated:YES];
}


- (IBAction)settingsBtn:(id)sender {
    LBSettingsViewController *viewController = [LBSettingsViewController new];
    [self.navigationController pushViewController:viewController animated:NO];
}

- (IBAction)addBoardBtn:(id)sender {
    //set the ui text field
    UITextField *tempTextField = [[UITextField alloc] initWithFrame:
                                  CGRectMake(0, 0, self.view.bounds.size.width - 70, 44)];
    tempTextField.delegate = self;
    tempTextField.textAlignment = NSTextAlignmentCenter;

    [teamBoardsArray addObject:tempTextField];

    [teamBoardTable reloadData];

    [tempTextField becomeFirstResponder];
}
@end
