//
//  NSString-SCHelper.m
//  PageMe
//
//  Created by Samuel Chandra on 12/18/10.
//  Copyright 2010 Samuel Chandra. All rights reserved.
//

#import "NSString-SCHelper.h"

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

- (NSString *)md5 
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
