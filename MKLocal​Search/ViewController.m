//
//  ViewController.m
//  MKLocal​Search
//
//  Created by Marcelo Sampaio on 2/1/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

#import "ViewController.h"
#import "ResultsTableViewController.h"

// Sample:   https://www.thorntech.com/2016/01/how-to-search-for-location-using-apples-mapkit/

@interface ViewController ()

@end

@implementation ViewController


#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    // location manager
    _locationManager = [[CLLocationManager alloc]init];

    _locationManager.delegate=self;
    _locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    [_locationManager requestWhenInUseAuthorization];
    [_locationManager requestLocation];
//    [_locationManager startUpdatingLocation];
    

    // Set up ResultsTableViewController
    [self setUpResultsScene];

    
    
    
//    // Navigation bar button item
//    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
//                                   initWithTitle:@"Flip"
//                                   style:UIBarButtonItemStyleDone
//                                   target:self
//                                   action:@selector(flipView)];
//    self.navigationItem.rightBarButtonItem = flipButton;
    

    
    

    
    
}

//#pragma mark - UI Actions
//-(void)flipView{
//    
//    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
//    request.naturalLanguageQuery = @"Restaurante";
//    request.region = _mapView.region;
//    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:request];
//    
//    
//    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
//        NSLog(@"Map Items: %@", response.mapItems);
//    }];
//    
//    
//}


#pragma mark - Location Manager Delegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    NSLog(@"Location Manager did update Locations");
    
    MKCoordinateSpan coordinateSpam = MKCoordinateSpanMake(0.05, 0.05);
    

    CLLocation *location = [locations objectAtIndex:0];
    
    
    MKCoordinateRegion coordinateRegion = MKCoordinateRegionMake(location.coordinate, coordinateSpam);
    
    
    [_mapView setRegion:coordinateRegion];
    
    
}
-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        NSLog(@"*** locationManager didChangeAuthorizationStatus.  Status: %d",status);
        [_locationManager requestLocation];
    }
}



-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
    NSLog(@"Location Manager ERROR");
    
}

#pragma mark - Location Search Helper
-(void)setUpResultsScene{
    
    UITableViewController *locationSearchTable = [self.storyboard instantiateViewControllerWithIdentifier:@"ResultsTableView"];
    
    _searchController = [[UISearchController alloc] initWithSearchResultsController:locationSearchTable];
    _searchController.searchResultsUpdater = locationSearchTable;
    
    // Search Bar
    
    UISearchBar *searchBar = _searchController.searchBar;
    [searchBar sizeToFit];
    searchBar.placeholder = @"Search for places";
    
    // embeds search bar in navigation controller
    self.navigationItem.titleView = _searchController.searchBar;
    
    [_searchController setHidesNavigationBarDuringPresentation:NO];
    
    _searchController.dimsBackgroundDuringPresentation=YES;
    [_searchController definesPresentationContext];
    
}



@end
