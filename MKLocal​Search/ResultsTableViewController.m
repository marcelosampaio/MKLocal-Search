//
//  ResultsTableViewController.m
//  MKLocal​Search
//
//  Created by Marcelo Sampaio on 2/1/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

#import "ResultsTableViewController.h"

@interface ResultsTableViewController ()

@end

@implementation ResultsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = @"Title";
    cell.detailTextLabel.text = @"Subtitle";
    
    
    return cell;
    
}

#pragma mark - Search Controller Delegate
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSLog(@"-> updateSearchResultsForSearchController ***");
}



@end
