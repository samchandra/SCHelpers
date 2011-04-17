//
//  SCReverseGeocoder.h
//  
//
//  Created by Samuel Chandra on 4/3/11.
//  Copyright 2011 Samuel Chandra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

#define kCurrentLocationTitleUpdatedNotification @"CurrentLocationTitleUpdated"

@interface SCReverseGeocoder : NSObject <MKReverseGeocoderDelegate> {
    MKReverseGeocoder *geocoder;
}

@property (nonatomic, assign) CLLocationCoordinate2D locationCoordinate;
@property (nonatomic, retain) NSString *currentLocationTitle;

+ (SCReverseGeocoder *)sharedManager;

- (void)start;
- (void)stop;
- (BOOL)isQuerying;

@end
