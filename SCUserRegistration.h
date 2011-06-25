//
//  TokenRegistration.h
//  HoneyBabe
//
//  Created by Samuel Chandra on 11/14/10.
//  Copyright 2010 Samuel Chandra. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kStringTokenRegistrationURL @"http://pagemeapp.appspot.com/register"

@protocol SCUserRegistrationDelegate 
- (void)userRegistrationResult:(NSDictionary *)resultDict;
@end

@interface SCUserRegistration : NSObject {
	id <SCUserRegistrationDelegate, NSObject> delegate;
	
	NSString *email;
	NSString *appToken;
	
}

@property (nonatomic, assign) id <SCUserRegistrationDelegate, NSObject> delegate;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *appToken;

- (void)sendRequest;

@end
