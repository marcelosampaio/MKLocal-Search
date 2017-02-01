//
//  ViewController.m
//  MKLocal​Search
//
//  Created by Marcelo Sampaio on 2/1/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

#import "ViewController.h"

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
