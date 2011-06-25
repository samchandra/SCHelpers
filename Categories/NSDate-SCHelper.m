//
//  NSDate-SCHelper.m
//  PageMe
//
//  Created by Samuel Chandra on 12/18/10.
//  Copyright 2010 Samuel Chandra. All rights reserved.
//

#import "NSDate-SCHelper.h"


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
