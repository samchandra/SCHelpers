//
//  SCHelper.h
//  Helper class for making thing easier
//
//  Created by Samuel Chandra on 10/27/10.
//  Copyright 2010 Samuel Chandra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

// Categories Helpers
#import "UIDevice-Hardware.h"
#import "NSDate-SCHelper.h"
#import "UIImage-SCHelper.h"
#import "NSString-SCHelper.h"

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

#pragma mark - Core Data
+ (NSManagedObjectContext *)moc;
+ (NSManagedObjectModel *)mom;

#pragma mark - Resources Folder
+ (NSString *)documentsFolder;
+ (NSString *)documentsFolderWithPath:(NSString *)path;
+ (NSURL *)applicationDocumentsDirectoryURL;

#pragma mark - Form Helper
// Return string or nil by checking its length
+ (NSString *)formStringWithString:(NSString *)stringData;

@end
