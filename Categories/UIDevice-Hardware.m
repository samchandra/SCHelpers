//
//  UIDevice-Hardware.m
//  HoneyBabe
//
//  Created by Samuel Chandra on 8/10/10.
//  Copyright 2010 Samuel Chandra. All rights reserved.
//

#import "UIDevice-hardware.h"
#include <sys/types.h>
#include <sys/sysctl.h>

@implementation UIDevice (Hardware)

#pragma mark -
#pragma mark Class Methods

+ (NSString *)udid {	
	return [self currentDevice].uniqueIdentifier;
}

#pragma mark -
#pragma mark Instance Methods

- (NSString *)platform {
	size_t size;
	sysctlbyname("hw.machine", NULL, &size, NULL, 0);
	char *machine = malloc(size);
	sysctlbyname("hw.machine", machine, &size, NULL, 0);
	//NSString *platform = [NSString stringWithCString:machine];
	NSString *platform = [NSString stringWithCString:machine encoding:NSASCIIStringEncoding];
	free(machine);
	return platform;
}

- (NSString *)platformString {
	NSString *platform = [self platform];
	if ([platform isEqualToString:@"iPhone1,1"]) return IPHONE_1G_NAMESTRING;
	if ([platform isEqualToString:@"iPhone1,2"]) return IPHONE_3G_NAMESTRING;
	if ([platform isEqualToString:@"iPhone2,1"]) return IPHONE_3GS_NAMESTRING;
	if ([platform isEqualToString:@"iPhone3,1"]) return IPHONE_4_NAMESTRING;
	if ([platform isEqualToString:@"iPod1,1"])   return IPOD_1G_NAMESTRING;
	if ([platform isEqualToString:@"iPod2,1"])   return IPOD_2G_NAMESTRING;
	return platform;
}


@end