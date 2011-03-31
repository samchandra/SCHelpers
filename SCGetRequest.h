//
//  SCGetRequest.h
//  CharlesAndKeith
//
//  Created by Samuel Chandra on 12/7/10.
//  Copyright 2010 Buuuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ASIHTTPRequest;

@protocol SCGetRequestDelegate

@optional
- (void)requestCompleted:(BOOL)status withDictionary:(NSDictionary *)resultDict;
- (void)requestCompleted:(BOOL)status withArray:(NSArray *)resultArray;
- (void)requestCompleted:(BOOL)status withError:(NSError *)error;

@end


@interface SCGetRequest : NSObject {
	NSURL *requestURL;
	ASIHTTPRequest *getRequest;
	
	id <SCGetRequestDelegate, NSObject> delegate;
}

@property (nonatomic, retain) NSURL *requestURL;
@property (nonatomic, retain) id <SCGetRequestDelegate, NSObject> delegate;

- (id)initWithURLString:(NSString *)urlString;
- (void)startRequest;

@end
