//
//  LMSViewController.m
//  TestLocationManager
//
//  Created by Lauren Shapiro on 2/18/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import "LMSViewController.h"
#import "LMSsharedLocationManager.h"

@interface LMSViewController ()
//@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) LMSsharedLocationManager *mySharedLocationManager;
@property BOOL shouldCenterLocation;
@end

@implementation LMSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // show alert if location services are disabled
    if( (![self.mySharedLocationManager.locationManager locationServicesEnabled]) ||
        [CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied)  {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Services Disabled"
                                                        message:@"You have not given this application permission to access your location. Go to Settings > Privacy > Location to grant permission for location information."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    self.mySharedLocationManager = [LMSsharedLocationManager sharedLocationManager];
    self.mySharedLocationManager.locationManager.delegate = self;
    
    
    // set accuracy and distance filter
    [self.mySharedLocationManager.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    [self.mySharedLocationManager.locationManager setDistanceFilter: 1000];
    [self.mySharedLocationManager.locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CLLocationManagerDelegate methods

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
    NSLog(@"lat: %f, lon:%f", location.coordinate.latitude, location.coordinate.longitude);
    [self addPinToMapAtLocation:location];
    
}


- (void)addPinToMapAtLocation:(CLLocation *)location
{
    MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
    pin.coordinate = location.coordinate;
    [self.mapView addAnnotation:pin];
    MKCoordinateRegion region;
    region.center = pin.coordinate;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.10;
    span.longitudeDelta = 0.10;
    region.span = span;
    [self.mapView setRegion:region];
    
    [self.mapView setCenterCoordinate: pin.coordinate animated: YES];
}

@end
