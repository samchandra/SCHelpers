//
//  SCPostRequest.m
//  Pedro
//
//  Created by Samuel Chandra on 1/6/11.
//  Copyright 2011 Buuuk. All rights reserved.
//

#import "SCPostRequest.h"
#import "ASIFormDataRequest.h"
#import "CJSONSerializer.h"
#import "CJSONDeserializer.h"

@implementation SCPostRequest

@synthesize requestURL;
@synthesize delegate;
@synthesize requestData;

- (id)initWithURLString:(NSString *)urlString 
{
	self = [super init];
	if (self) {
		SCLog(@"I am SCPostRequest initWithURLString: %@", urlString);
		[self setRequestURL:[NSURL URLWithString:urlString]];
		CFShow(self.requestURL);
		
		postRequest = [ASIFormDataRequest requestWithURL:[self requestURL]];
		[postRequest retain];
		[postRequest setDelegate:self];
	}
	
	return self;
}

- (void)loadData {
	NSAssert([[self.requestData allKeys] count] > 0, @"It should not be blank");

	for (NSString *key in [self.requestData allKeys]) {
		// Convert data to JSON before sending to server
		NSError *error;
		
		// Serialize data according to the data type
		NSData *jsonData;
		
		// Array
		if ([[self.requestData valueForKey:key] isKindOfClass:[NSArray class]]) {
		  jsonData = [[CJSONSerializer serializer] serializeArray:[self.requestData valueForKey:key] error:&error];
		}
		// NSNumber
		else if ([[self.requestData valueForKey:key] isKindOfClass:[NSNumber class]]) { 
			jsonData = [[CJSONSerializer serializer] serializeNumber:[self.requestData valueForKey:key] error:&error];
		}
		// NSString
		else if ([[self.requestData valueForKey:key] isKindOfClass:[NSString class]]) {
			jsonData = [[CJSONSerializer serializer] serializeString:[self.requestData valueForKey:key] error:&error];
		}
		else {
			jsonData = nil;
		}

		NSString *jsonString = [[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding] autorelease];
		NSLog(@"jsonString = %@", jsonString);
		[postRequest setPostValue:jsonString forKey:key];
		
	}
}

- (void)startRequest {
	NSLog(@"I am SCPostRequest startRequest");
	[postRequest startAsynchronous];
}

- (void)requestFinished:(ASIFormDataRequest *)request {
	NSLog(@"I am SCPostRequest requestFinished");
	NSData *jsonData = [[request responseString] dataUsingEncoding:NSUTF8StringEncoding];
	
	NSError *error;
	NSArray *result = [[CJSONDeserializer deserializer] deserializeAsArray:jsonData error:&error];
	
	//CFShow(result);
	[delegate requestCompleted:YES withArray:result];	
}

- (void)requestFailed:(ASIFormDataRequest *)request {
	NSLog(@"I am SCPostRequest requestFailed");
	NSError *error = [request error];
	[delegate requestCompleted:YES withError:error];
}

- (void)dealloc { 
	[requestURL release];
	[delegate release];
	[requestData release];
	[super dealloc];
}

@end
