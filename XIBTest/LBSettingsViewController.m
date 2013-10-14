//
//  LBSettingsViewController.m
//  XIBTest
//
//  Created by Syarif on 10/12/13.
//  Copyright (c) 2013 A&A. All rights reserved.
//

#import "LBSettingsViewController.h"

@interface LBSettingsViewController ()

@end

@implementation LBSettingsViewController
@synthesize settingsTable,settingsArray;

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
    self.settingsTable.delegate = self;
    self.settingsTable.dataSource = self;
    self.settingsArray = [[NSMutableArray alloc] initWithObjects:@"Facebook",@"Twitter",@"LinkedIn", nil];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}

- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section) {
        case 0:
            sectionName = [settingsArray objectAtIndex:section];
            break;
        case 1:
            sectionName = [settingsArray objectAtIndex:section];
            break;
        case 2:
            sectionName = [settingsArray objectAtIndex:section];
            break;
        default:
            sectionName = @" ";
            break;
    }
    return sectionName;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)boardBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:NO];
}
@end
