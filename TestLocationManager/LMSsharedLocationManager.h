//
//  LMSsharedLocationManager.h
//  TestLocationManager
//
//  Created by Lauren Shapiro on 2/18/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface LMSsharedLocationManager : NSObject
@property (nonatomic, retain) CLLocationManager *locationManager;
+ (id) sharedLocationManager;
@end
