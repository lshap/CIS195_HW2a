//
//  LMSViewController.h
//  TestLocationManager
//
//  Created by Lauren Shapiro on 2/18/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface LMSViewController : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
