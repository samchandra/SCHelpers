//
//  SCPostRequest.h
//  For doing post request, it has dependency on:
//  1. ASIHTTP Library
//  2. TouchJSON library
//
//  Created by Samuel Chandra on 1/6/11.
//  Copyright 2011 Samuel Chandra. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ASIFormDataRequest;

@protocol SCPostRequestDelegate

@optional 
- (void)requestCompleted:(BOOL)status withDictionary:(NSDictionary *)resultDict;
- (void)requestCompleted:(BOOL)status withArray:(NSArray *)resultArray;
- (void)requestCompleted:(BOOL)status withError:(NSError *)error;
@end

@interface SCPostRequest : NSObject {
	NSURL *requestURL;
	ASIFormDataRequest *postRequest;
	NSDictionary *requestData;
	
	id <SCPostRequestDelegate, NSObject> delegate;
}

@property (nonatomic, retain) NSURL *requestURL;
@property (nonatomic, retain) NSDictionary *requestData;
@property (nonatomic, retain) id <SCPostRequestDelegate, NSObject> delegate;

- (id)initWithURLString:(NSString *)urlString;
- (void)loadData;
- (void)startRequest;

@end
