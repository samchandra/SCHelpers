//
//  UIDevice-Hardware.h
//  HoneyBabe
//
//  Created by Samuel Chandra on 8/10/10.
//  Copyright 2010 Samuel Chandra. All rights reserved.
//

#import <UIKit/UIKit.h>

#define IPHONE_1G_NAMESTRING  @"iPhone 1G"
#define IPHONE_3G_NAMESTRING  @"iPhone 3G"
#define IPHONE_3GS_NAMESTRING @"iPhone 3GS"
#define IPHONE_4_NAMESTRING   @"iPhone 4"
#define IPOD_1G_NAMESTRING    @"iPod touch 1G"
#define IPOD_2G_NAMESTRING    @"iPod touch 2G"

@interface UIDevice (Hardware)
+ (NSString *)udid;

- (NSString *)platform;
- (NSString *)platformString;
@end