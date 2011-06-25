//
//  NSString-SCHelper.h
//  PageMe
//
//  Created by Samuel Chandra on 12/18/10.
//  Copyright 2010 Samuel Chandra. All rights reserved.
//

#import <Foundation/Foundation.h>


//
// NSString (SCHelper)
//
@interface NSString (SCHelper)
- (NSString *)stringForDisplay;
- (NSString *)flattenHTML;
- (NSString *)md5;

@end
