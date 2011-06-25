//
//  NSDate-SCHelper.h
//  PageMe
//
//  Created by Samuel Chandra on 12/18/10.
//  Copyright 2010 Samuel Chandra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (SCHelper)

- (NSString *)stringShortDate;
- (NSString *)stringMediumDate;
- (NSString *)stringLongDate;

- (NSString *)stringShortTime;
- (NSString *)stringMediumTime;
- (NSString *)stringLongTime;

- (NSString *)stringShortDateShortTime;
- (NSString *)stringMediumDateShortTime;
- (NSString *)stringLongDateShortTime;

@end
