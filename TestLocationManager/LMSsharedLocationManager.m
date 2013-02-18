//
//  LMSsharedLocationManager.m
//  TestLocationManager
//
//  Created by Lauren Shapiro on 2/18/13.
//  Copyright (c) 2013 Lauren Shapiro. All rights reserved.
//

#import "LMSsharedLocationManager.h"
static LMSsharedLocationManager *sharedMyMan = nil;

@implementation LMSsharedLocationManager
+ (id) sharedLocationManager {
    @synchronized(self){
        if (sharedMyMan == nil) {
            sharedMyMan = [[self alloc]init];
        }
    }
    return sharedMyMan;
}

-(id) init  {
    if (self = [super init])
    {
        self.locationManager = [[CLLocationManager alloc]init];
    }
    return self;
}

@end
