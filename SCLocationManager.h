//
//  SCLocationManager.h
//  Generic Location Manager to encapsulate all task that relates
//  to obtaining location
//
//  Created by Samuel Chandra on 12/2/10.
//  Copyright 2010 Samuel Chandra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

// Custom App Services Notification
#define kCurrentLocationUpdatedNotification @"CurrentLocationUpdated"

@interface SCLocationManager : NSObject <CLLocationManagerDelegate> {
	CLLocationManager *locationManager;
	CLLocation *currentLocation;
}

+ (SCLocationManager *)sharedLocationManager;

@property (retain) CLLocation *currentLocation;

- (void)startUpdatingLocation;
- (void)stopUpdatingLocation;

@end
