//
//  UIImage-SCHelper.m
//  PageMe
//
//  Created by Samuel Chandra on 12/18/10.
//  Copyright 2010 Samuel Chandra. All rights reserved.
//

#import "UIImage-SCHelper.h"


//
// UIImage (SCHelper)
//
@implementation UIImage (SCHelper)

#pragma mark -
#pragma make UIImage Helper

- (UIImage *)generateThumbFillSize:(CGSize)viewsize {
	CGSize size = self.size;
	
	CGFloat scalex = viewsize.width / size.width;
	CGFloat scaley = viewsize.height / size.height; 
	CGFloat scale = MAX(scalex, scaley);	
	
	UIGraphicsBeginImageContext(viewsize);
	
	CGFloat width = size.width * scale;
	CGFloat height = size.height * scale;
	
	float dwidth = ((viewsize.width - width) / 2.0f);
	float dheight = ((viewsize.height - height) / 2.0f);
	
	CGRect rect = CGRectMake(dwidth, dheight, size.width * scale, size.height * scale);
	[self drawInRect:rect];
	
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();  
	
	CFShow(newimg);
    return newimg;  
	
}

@end
