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

//
// NSDate Category
//
@implementation NSDate (SCHelper)

#pragma mark -
#pragma mark Date Category

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
// UIImage Category
//
@implementation UIImage (SCHelper)

#pragma mark -
#pragma make UIImage Category

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

    return newimg;  	
}

@end

//
// NSString Category
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

- (NSString *)flattenHTML
{
	NSScanner *theScanner;
	NSString *text = nil;
	
	theScanner = [NSScanner scannerWithString:self];
	while ([theScanner isAtEnd] == NO) {
		// find the start of tag
		[theScanner scanUpToString:@"<" intoString:NULL];
		// find end of tag
		[theScanner scanUpToString:@">" intoString:&text];
		// replace the found tag with a space
		// you can filter multi-spaces out later if you wish
		self = [self stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>", text] withString:@""];
	}
	
	return self;
}

- (NSString *)MD5 
{
	const char *cStr = [self UTF8String];
	unsigned char result[16];
	CC_MD5( cStr, strlen(cStr), result );
	return [NSString stringWithFormat:
			@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
			result[0], result[1], result[2], result[3], 
			result[4], result[5], result[6], result[7],
			result[8], result[9], result[10], result[11],
			result[12], result[13], result[14], result[15]
			]; 
}


@end
