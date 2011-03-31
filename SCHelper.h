//
//  SCHelper.h
// 
//
//  Created by Samuel Chandra on 10/27/10.
//  Copyright 2010 Samuel Chandra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

// Custom App Services Notification
#define kCurrentLocationUpdatedNotification @"CurrentLocationUpdated"
// Color codes
#define kNonEditableTextColor [UIColor colorWithRed:.318 green:0.4 blue:.569 alpha:1.0]
#define kColorPink			  [UIColor colorWithRed:1.0 green:192.0/255.0 blue:203.0/255.0 alpha:1.0]

// DataEntryType for table cell rows
#define kDataEntryTypeString        1
#define kDataEntryTypeText          2
#define kDataEntryTypeNumber        3
#define kDataEntryTypeSelection     4
#define kDataEntryTypeDateSelection 5
#define kDataEntryTypeLabel         6

// PickerView
#define kDatePickerView   101
#define kCustomPickerView 102

//
// Application Specific
//
@class Setting;

//
// SCHelper
//
@interface SCHelper : NSObject {
}

#pragma mark -
#pragma mark Application Delegate
// Application Specific
+ (id)appDelegate;

#pragma mark -
#pragma mark Core Data
+ (NSManagedObjectContext *)moc;
+ (NSManagedObjectModel *)mom;
+ (Setting *)appSetting;

#pragma mark -
#pragma mark Resources Folder
+ (NSString *)documentsFolder;

@end

//
// NSDate (SCHelper)
//
@interface NSDate (SCHelper) 
- (NSString *)stringShortDate;
- (NSString *)stringMediumDate;
- (NSString *)stringLongDate;

- (NSString *)stringShortTime;
- (NSString *)stringMediumTime;
- (NSString *)stringLongTime;

- (NSString *)stringShortDateShortTime;
- (NSString *)stringMediumDateShortTime;
- (NSString *)stringLongDateShortTime;

@end

//
// UIImage (SCHelper)
//
@interface UIImage (SCHelper)
- (UIImage *)generateThumbFillSize:(CGSize)viewsize;

@end

//
// NSString (SCHelper)
//
@interface NSString (SCHelper)
- (NSString *)stringForDisplay;

@end
