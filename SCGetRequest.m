//
//  SCGetRequest.m
//  CharlesAndKeith
//
//  Created by Samuel Chandra on 12/7/10.
//  Copyright 2010 Buuuk. All rights reserved.
//

#import "SCGetRequest.h"
#import "ASIHTTPRequest.h"
#import "CJSONDeserializer.h"

@implementation SCGetRequest

@synthesize requestURL;
@synthesize delegate;

- (id)initWithURLString:(NSString *)urlString {
	self = [super init];
	if (self) {
		SCLog(@"I am SCGetRequest initWithURLString:%@", urlString);
		[self setRequestURL:[NSURL URLWithString:urlString]];
		CFShow(self.requestURL);

		getRequest = [ASIHTTPRequest requestWithURL:[self requestURL]];
		[getRequest retain];
		[getRequest setDelegate:self];
	}
	return self;
}

- (void)startRequest {
	SCLog(@"I am SCGetRequest startRequest");
	[getRequest startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request {
	SCLog(@"I am SCGetRequest requestFinished");
	NSData *jsonData = [[request responseString] dataUsingEncoding:NSUTF8StringEncoding];
	
	NSError *error;
	NSArray *result = [[CJSONDeserializer deserializer] deserializeAsArray:jsonData error:&error];
	
	//CFShow(result);
	
	if ([result count] == 1) {
		SCLog(@"I am SCGetRequest requestFinished withDictionary");
		[delegate requestCompleted:YES withDictionary:[result lastObject]];
	}
	else {
		SCLog(@"I am SCGetRequest requestFinished withArray");		
		[delegate requestCompleted:YES withArray:result];
	}
}

- (void)requestFailed:(ASIHTTPRequest *)request {
	SCLog(@"I am SCGetRequest requestFailed");
	NSError *error = [request error];
	[delegate requestCompleted:YES withError:error];
}

- (void)dealloc {
	[requestURL release];
	[getRequest release];
	[delegate release];
	[super dealloc];
}

@end
