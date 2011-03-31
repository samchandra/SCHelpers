//
//  SCHelper.m
//
//  Created by Samuel Chandra on 10/27/10.
//  Copyright 2010 Samuel Chandra. All rights reserved.
//

#import "SCHelper.h"

//
// Application Specific
//
#import "Setting.h"

//
// SCHelper
//
@implementation SCHelper

#pragma mark -
#pragma mark Application Delegate

// Application Specific
// Return the Application Delegate singleton
+ (id)appDelegate {
	return [[UIApplication sharedApplication] delegate];	
}

#pragma mark -
#pragma mark Core Data

+ (NSManagedObjectContext *)moc {
	return [[SCHelper appDelegate] managedObjectContext];
}

+ (NSManagedObjectModel *)mom {
	return [[SCHelper appDelegate] managedObjectModel];
}

+ (Setting *)appSetting {
	// Create Request
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	
	// Set Entity
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Setting" inManagedObjectContext:[SCHelper moc]];
	[request setEntity:entity];
	
	// Fetch request
	NSError *error;
	NSMutableArray *mutableFetchResults = [[[[SCHelper moc] executeFetchRequest:request error:&error] mutableCopy] autorelease];
	
	// Release request
	[request release];
	
	Setting *result;
	if ([mutableFetchResults lastObject] == nil) {
        
		SCLog(@"I am SCHelper creating a new setting record");
		
		// Create setting record
		Setting *newSetting = (Setting *)[NSEntityDescription insertNewObjectForEntityForName:@"Setting" inManagedObjectContext:[SCHelper moc]];
		
		if (![[SCHelper moc] save:&error]) {
            
        SCLog(@"Setting record cannot be created");
            
		}
		
		result = newSetting;
	}
	else {
        
		SCLog(@"I am SCHelper returning an existing record");
		//SCLog(@"%@", [mutableFetchResults lastObject]);        

		// Return an existing setting record
		result = [mutableFetchResults lastObject];
	}
	
	return result;
}


#pragma mark -
#pragma mark Resources Folder

+ (NSString *)documentsFolder {
	return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}

+ (NSString *)documentsFolderWithPath:(NSString *)path {
	return [[self documentsFolder] stringByAppendingPathComponent:path];
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

//
// NSDate (SCHelper)
//
@implementation NSDate (SCHelper)

#pragma mark -
#pragma mark Date Helpers

- (NSString *)stringShortDate {
	NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
	[formatter setDateStyle:NSDateFormatterShortStyle];
	[formatter setTimeStyle:NSDateFormatterNoStyle];	
	return [formatter stringFromDate:self];
}	
- (NSString *)stringMediumDate {
	NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
	[formatter setDateStyle:NSDateFormatterMediumStyle];
	[formatter setTimeStyle:NSDateFormatterNoStyle];		
	return [formatter stringFromDate:self];
}	
- (NSString *)stringLongDate {
	NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
	[formatter setDateStyle:NSDateFormatterLongStyle];
	[formatter setTimeStyle:NSDateFormatterNoStyle];		
	return [formatter stringFromDate:self];
}

- (NSString *)stringShortTime { 
	NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
	[formatter setTimeStyle:NSDateFormatterShortStyle];
	[formatter setDateStyle:NSDateFormatterNoStyle];	
	return [formatter stringFromDate:self];
}	
- (NSString *)stringMediumTime { 
	NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
	[formatter setTimeStyle:NSDateFormatterMediumStyle];
	[formatter setDateStyle:NSDateFormatterNoStyle];	
	return [formatter stringFromDate:self];
}	
- (NSString *)stringLongTime { 
	NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
	[formatter setTimeStyle:NSDateFormatterLongStyle];
	[formatter setDateStyle:NSDateFormatterNoStyle];	
	return [formatter stringFromDate:self];
}	

- (NSString *)stringShortDateShortTime{
	NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
	[formatter setDateStyle:NSDateFormatterShortStyle];
	[formatter setTimeStyle:NSDateFormatterShortStyle];
	return [formatter stringFromDate:self];
}	
- (NSString *)stringMediumDateShortTime{
	NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
	[formatter setDateStyle:NSDateFormatterMediumStyle];
	[formatter setTimeStyle:NSDateFormatterShortStyle];
	return [formatter stringFromDate:self];
}	
- (NSString *)stringLongDateShortTime{
	NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
	[formatter setDateStyle:NSDateFormatterLongStyle];
	[formatter setTimeStyle:NSDateFormatterShortStyle];
	return [formatter stringFromDate:self];
}	

@end

//
// UIImage (SCHelper)
//
@implementation UIImage (SCHelper)

#pragma mark -
#pragma make UIImage Helper

- (UIImage *)generateThumbFillSize:(CGSize)viewsize 
{
    CGSize size = self.size;
    
    CGFloat scalex = viewsize.width / size.width;
    CGFloat scaley = viewsize.height / size.height; 
    CGFloat scale = MAX(scalex, scaley);	
    
    UIGraphicsBeginImageContext(viewsize);
    
    CGFloat width = size.width * scale;
    CGFloat height = size.height * scale;
    
    float dwidth = ((viewsize.width - width) / 2.0f);
    float dheight = ((viewsize.height - height) / 2.0f);
    
    CGRect rect = CGRectMake(dwidth, dheight, size.width * scale, size.height * scale);
    [self drawInRect:rect];
    
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();  

    SCLog("%@", newimg);
    return newimg;  
	
}

@end

//
// NSString (SCHelper)
//
@implementation NSString (SCHelper)
- (NSString *)stringForDisplay {
	if ( ([self isEqual:nil]) || (!([self length] > 0)) ) {
		return @"";
	}
	else {
		return self;
	}
}

@end
