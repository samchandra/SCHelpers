//
//  UIDevice-Hardware.h
//  HoneyBabe
//
//  Code taken from Erica Sadun. Iphone Cookbook 3.0
//  Her repository is in Github
//
//  Created by Samuel Chandra on 8/10/10.
//  Copyright 2010 Samuel Chandra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>


// Simulator
#define IPHONE_SIMULATOR_NAMESTRING			@"iPhone Simulator"
#define IPHONE_SIMULATOR_IPHONE_NAMESTRING	@"iPhone Simulator"
#define IPHONE_SIMULATOR_IPAD_NAMESTRING	@"iPad Simulator"
// Iphone
#define IPHONE_1G_NAMESTRING                @"iPhone 1G"
#define IPHONE_3G_NAMESTRING                @"iPhone 3G"
#define IPHONE_3GS_NAMESTRING               @"iPhone 3GS"
#define IPHONE_4_NAMESTRING                 @"iPhone 4"
#define IPHONE_5_NAMESTRING                 @"iPhone 5"
#define IPHONE_UNKNOWN_NAMESTRING           @"Unknown iPhone"
// Ipod Touch
#define IPOD_1G_NAMESTRING                  @"iPod touch 1G"
#define IPOD_2G_NAMESTRING                  @"iPod touch 2G"
#define IPOD_3G_NAMESTRING                  @"iPod touch 3G"
#define IPOD_4G_NAMESTRING                  @"iPod touch 4G"
#define IPOD_UNKNOWN_NAMESTRING             @"Unknown iPod"
// Ipad
#define IPAD_1G_NAMESTRING                  @"iPad 1G"
#define IPAD_2G_NAMESTRING                  @"iPad 2G"
#define IPAD_UNKNOWN_NAMESTRING             @"Unknown iPad"
// Apple TV and others
#define APPLETV_2G_NAMESTRING               @"Apple TV 2G"
#define IOS_FAMILY_UNKNOWN_DEVICE			@"Unknown iOS device"
#define IFPGA_NAMESTRING                    @"iFPGA"

typedef enum {
	UIDeviceUnknown,
    
	UIDeviceiPhoneSimulator,
	UIDeviceiPhoneSimulatoriPhone, // both regular and iPhone 4 devices
	UIDeviceiPhoneSimulatoriPad,
    
	UIDevice1GiPhone,
	UIDevice3GiPhone,
	UIDevice3GSiPhone,
	UIDevice4iPhone,
	UIDevice5iPhone,
    
	UIDevice1GiPod,
	UIDevice2GiPod,
	UIDevice3GiPod,
	UIDevice4GiPod,
    
	UIDevice1GiPad, // both regular and 3G
	UIDevice2GiPad,
    
	UIDeviceAppleTV2,
    
	UIDeviceUnknowniPhone,
	UIDeviceUnknowniPod,
	UIDeviceUnknowniPad,
	UIDeviceIFPGA,
    
} UIDevicePlatform;

@interface UIDevice (Hardware)
- (NSString *)udid;

- (NSString *)carrierName;
- (NSString *)mobileCountryCode;
- (NSString *)mobileNetworkCode;

- (NSString *)platform;
- (NSString *)hwModel;
- (NSUInteger)platformType;
- (NSString *)platformString;
- (NSString *)platformCode;

- (NSUInteger)cpuFrequency;
- (NSUInteger)busFrequency;
- (NSUInteger)totalMemory;
- (NSUInteger)userMemory;

- (NSNumber *)totalDiskSpace;
- (NSNumber *)freeDiskSpace;

- (NSString *)macAddress;
@end