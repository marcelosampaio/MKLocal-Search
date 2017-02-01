//
//  ViewController.h
//  MKLocal​Search
//
//  Created by Marcelo Sampaio on 2/1/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface ViewController : UIViewController <CLLocationManagerDelegate,MKMapViewDelegate,UISearchControllerDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic,strong) CLLocationManager *locationManager;
//@property (nonatomic,strong) UISearchController *searchController;


@end

