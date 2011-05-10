//
//  SCReverseGeocoder.m
//  
//
//  Created by Samuel Chandra on 4/3/11.
//  Copyright 2011 Samuel Chandra. All rights reserved.
//

#import "SCReverseGeocoder.h"

static SCReverseGeocoder *_sharedGeocoderManager = nil;

@implementation SCReverseGeocoder
@synthesize locationCoordinate;
@synthesize currentLocationTitle;

#pragma mark class methods
+ (SCReverseGeocoder *)sharedManager
{
    if (!_sharedGeocoderManager)
    {
        SCLog(@"... shared manager created")
        _sharedGeocoderManager = [[[self class] alloc] init];
    }
    
    return _sharedGeocoderManager;
}

#pragma mark object lifecycle
- (id)init
{
    return [super init];
}

- (void)dealloc
{
    [geocoder release];
    [self.currentLocationTitle release];
    [super dealloc];
}

#pragma mark instance methods
- (BOOL)isQuerying
{
    if (geocoder && geocoder.querying)
        return YES;
    else
        return NO;
}

- (void)start
{
    if (!CLLocationCoordinate2DIsValid(self.locationCoordinate))
    {
        SCLog(@"... LocationCoordinate used for reverse geocoding is invalid");
        return;
    }
    
    // Only one request can run at the same time
    if (!geocoder) {
        // init
        geocoder = [[MKReverseGeocoder alloc] initWithCoordinate:self.locationCoordinate];
        geocoder.delegate = self;
        
        SCLog(@"... Reverse Geocoding");
		// Reverse Geo Code
        [geocoder start];        

    }
	else if (geocoder && !geocoder.querying) {
        // cancel and release geocoder before init again
        [geocoder cancel];
        [geocoder release];
        geocoder = nil;
        
        // init
        geocoder = [[MKReverseGeocoder alloc] initWithCoordinate:self.locationCoordinate];
        geocoder.delegate = self;

        SCLog(@"... Reverse Geocoding");
		// Reverse Geo Code
        [geocoder start];        
	}
    else
        return;

}

- (void)stop
{
    if (!CLLocationCoordinate2DIsValid(self.locationCoordinate))
    {
        SCLog(@"... LocationCoordinate used for reverse geocoding is invalid");
        return;
    }

    if (geocoder && geocoder.querying) {
        [geocoder cancel];
    }
}


#pragma mark delegate MKReverseGeocoder
- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error {
	SCLog(@"... Reverse Geocoder failed, with error %@", [error localizedDescription]);
	
	// Show alert when failed
	UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Reverse GeoCoder Failed" message:@"The Reverse GeoCoder service was not responding to query, it might be caused by poor network signal." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[av show];
	[av release];
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark {
	SCLog(@"... Reverse Geocoder successful");
	NSArray *currentAddressArray = [placemark.addressDictionary valueForKey:@"FormattedAddressLines"];
	
	if ([currentAddressArray count] == 0) 
    {
		currentLocationTitle = @"Unknown Location";
	}
	else 
    {
		currentLocationTitle = [NSString stringWithFormat:@"%@, %@", [currentAddressArray objectAtIndex:0], [currentAddressArray objectAtIndex:1]];
	}
    
    SCLog(@"... Current location title %@", currentLocationTitle);
    [[NSNotificationCenter defaultCenter] postNotificationName:kCurrentLocationTitleUpdatedNotification object:self];
}


@end
