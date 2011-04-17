//
//  SCLocationManager.m
//  
//
//  Created by Samuel Chandra on 12/2/10.
//  Copyright 2010 Samuel Chandra. All rights reserved.
//

#import "SCLocationManager.h"

static CLLocationAccuracy const kRegionAccuracy = 100.0; // meters
static SCLocationManager *_sharedLocationManager = nil;

@implementation SCLocationManager

@synthesize currentLocation;

#pragma mark class methods

+ (SCLocationManager *)sharedManager {
	if (!_sharedLocationManager) {
        
        // This will call the - init method and setup all the initial states
        // please note that self keyword in class methods refers to the class object
        // and not to an instance of the class itself
		_sharedLocationManager = [[[self class] alloc] init];
	}
    
	return _sharedLocationManager;
}

+ (BOOL)checkLocationServiceAvailability {
	if ([CLLocationManager locationServicesEnabled]) {
		return YES;
	}
	else {
		// Show alertview
		UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Location Service Disabled" 
													 message:@"Please enable Location Service for this App in the Device Settings" 
													delegate:self 
										   cancelButtonTitle:@"OK" 
										   otherButtonTitles:nil];
		[av show];
		[av release];
		
		return NO;
	}
}

#pragma mark instance methods

- (id)init {
    
	if ([[self class] checkLocationServiceAvailability]) {
		
		if ((self = [super init])) {
			locationManager = [[CLLocationManager alloc] init];
			locationManager.delegate = self;
			locationManager.desiredAccuracy = kCLLocationAccuracyBest;
			locationManager.distanceFilter = 5.0f; // in meters
		}
	}
	
	return self;
}

- (void)startUpdatingLocation {
	[locationManager startUpdatingLocation];
}

- (void)stopUpdatingLocation {
	[locationManager stopUpdatingLocation];
}

#pragma mark -
#pragma mark Core Location Manager Delegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
	// Respond to the rare location manager failure
	SCLog(@"... Location manager encountered an error: %@", [error localizedDescription]);
	return;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation 
		   fromLocation:(CLLocation *)oldLocation {
	
	SCLog(@"... Location Manager location update received");
	
	// The first location update is always stored as initial value
	if (!self.currentLocation) {
		self.currentLocation = newLocation;
		
		// Post Notification that current location has been updated
		[[NSNotificationCenter defaultCenter] postNotificationName:kCurrentLocationUpdatedNotification object:self];
	}
	// Accuracy is better so we record it
	else if (newLocation.horizontalAccuracy < self.currentLocation.horizontalAccuracy) {	
		self.currentLocation = newLocation;
		
		// Post Notification that current location has been updated
		[[NSNotificationCenter defaultCenter] postNotificationName:kCurrentLocationUpdatedNotification object:self];
	}
	// Accuracy is worse so do nothing
	else {
		// Do Nothing
	}
	
}

#pragma mark -
#pragma mark Memory Management
- (void)dealloc {
	[locationManager release];
	[currentLocation release];
	
	[super dealloc];
}


@end
