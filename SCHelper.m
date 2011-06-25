//
//  SCHelper.m
//
//  Created by Samuel Chandra on 10/27/10.
//  Copyright 2010 Samuel Chandra. All rights reserved.
//

#import "SCHelper.h"

//
// SCHelper
//
@implementation SCHelper

#pragma mark - Application Specific

// Return the Application Delegate singleton
+ (id)appDelegate 
{
	return [[UIApplication sharedApplication] delegate];	
}

+ (UIWindow *)window 
{
    return [[SCHelper appDelegate] window];
}

#pragma mark - Core Data

+ (NSManagedObjectContext *)moc {
	return [[SCHelper appDelegate] managedObjectContext];
}

+ (NSManagedObjectModel *)mom {
	return [[SCHelper appDelegate] managedObjectModel];
}


#pragma mark -
#pragma mark Resources Folder

+ (NSString *)documentsFolder {
	return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}

+ (NSString *)documentsFolderWithPath:(NSString *)path {
	return [[self documentsFolder] stringByAppendingPathComponent:path];
}

+ (NSURL *)applicationDocumentsDirectoryURL
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory 
                                                   inDomains:NSUserDomainMask] lastObject];
}

#pragma mark -
#pragma mark Form Helper

+ (NSString *)formStringWithString:(NSString *)stringData {
	if ( (!stringData) || (!([stringData length] > 0)) ) {
		return nil;
	}
	else {
		return stringData;
	}
}

@end
