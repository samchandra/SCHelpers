//
//  TokenRegistration.m
//  HoneyBabe
//
//  Created by Samuel Chandra on 11/14/10.
//  Copyright 2010 Samuel Chandra. All rights reserved.
//

#import "SCUserRegistration.h"
#import "ASIFormDataRequest.h"
#import "UIDevice-Hardware.h"
#import "CJSONDeserializer.h"

@implementation SCUserRegistration
@synthesize appToken;
@synthesize delegate;
@synthesize email;

- (id)init {
	self = [super init];
	if (!self) return nil;
	
	return self;
}

- (void)dealloc {
	[delegate release];
	[email release];
	[appToken release];
	[super dealloc];
}

- (void)sendRequest {
	SCLog(@"PageMe Server User Registration called");
	
	UIDevice *device = [UIDevice currentDevice];
	
	NSURL *url = [NSURL URLWithString:kStringTokenRegistrationURL];
	ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
	[request setPostValue:self.email forKey:@"e"];
	[request setPostValue:self.appToken forKey:@"t"];
	[request setPostValue:device.uniqueIdentifier forKey:@"u"];
	[request setPostValue:device.systemName forKey:@"system"];
	[request setPostValue:device.systemVersion forKey:@"v"];
	[request setPostValue:device.model forKey:@"m"];
	[request setPostValue:device.platformString forKey:@"p"];
	
	[request setDelegate:self];
	[request startAsynchronous];
}

#pragma mark -
#pragma mark ASIHTTPRequest Delegate

- (void)requestFinished:(ASIHTTPRequest *)request {
	// When it is successful, it will return json with status 1
	// Use when fetching text data
	NSLog(@"Device Registration async request response is %@", [request responseString]);
	NSData *jsonData = [[request responseString] dataUsingEncoding:NSUTF8StringEncoding];
	NSDictionary *dictionary = [[CJSONDeserializer deserializer] deserializeAsDictionary:jsonData error:nil];
	CFShow(dictionary);
	
	[delegate userRegistrationResult:dictionary];
}

- (void)requestFailed:(ASIHTTPRequest *)request {
	NSError *error = [request error];
    if (error)
    {
        NSLog(@"Device Registration async request encounter an error %@", [error localizedDescription]);
    }
}

@end
