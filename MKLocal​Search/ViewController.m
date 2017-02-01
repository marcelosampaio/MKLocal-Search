//
//  ViewController.m
//  MKLocal​Search
//
//  Created by Marcelo Sampaio on 2/1/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

#import "ViewController.h"
#import "ResultsTableViewController.h"

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
    
    
    // Navigation bar button item
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Flip"
                                   style:UIBarButtonItemStyleDone
                                   target:self
                                   action:@selector(flipView)];
    self.navigationItem.rightBarButtonItem = flipButton;
    
    
    
    
}

#pragma mark - UI Actions
-(void)flipView{
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = @"Restaurante";
    request.region = _mapView.region;
    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:request];
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        NSLog(@"Map Items: %@", response.mapItems);
    }];
}


#pragma mark - Location Manager Delegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    NSLog(@"Location Manager did update Locations");
    
    MKCoordinateSpan coordinateSpam = MKCoordinateSpanMake(0.05, 0.05);
    

    CLLocation *location = [locations objectAtIndex:0];
    
    
    MKCoordinateRegion coordinateRegion = MKCoordinateRegionMake(location.coordinate, coordinateSpam);
    
    
    [_mapView setRegion:coordinateRegion];
    
    
}
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
    NSLog(@"Location Manager ERROR");
    
}



@end
