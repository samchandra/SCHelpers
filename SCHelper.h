//
//  SCHelper.h
//  Helper class for making thing easier
//
//  Created by Samuel Chandra on 10/27/10.
//  Copyright 2010 Samuel Chandra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

// Color codes
#define kNonEditableTextColor [UIColor colorWithRed:.318 green:0.4 blue:.569 alpha:1.0]
#define kColorPink			  [UIColor colorWithRed:1.0 green:192.0/255.0 blue:203.0/255.0 alpha:1.0]

//
// SCHelper
//
@interface SCHelper : NSObject {
}

#pragma mark -
#pragma mark Application Delegate

// Application AppDelegate instance
+ (id)appDelegate;
+ (UIWindow *)window;

#pragma mark -
#pragma mark Core Data
+ (NSManagedObjectContext *)moc;
+ (NSManagedObjectModel *)mom;

#pragma mark -
#pragma mark Resources Folder
+ (NSString *)documentsFolder;
+ (NSString *)documentsFolderWithPath:(NSString *)path;

#pragma mark -
#pragma mark Form Helper
// Return string or nil by checking its length
+ (NSString *)formStringWithString:(NSString *)stringData;

@end

//
// NSDate Category
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
// UIImage Category
//
@interface UIImage (SCHelper)
- (UIImage *)generateThumbFillSize:(CGSize)viewsize;

@end

//
// NSString Category
//
@interface NSString (SCHelper)
- (NSString *)stringForDisplay;
- (NSString *)flattenHTML;
- (NSString *)MD5;


@end
