//
//  UIImage+IF.m
//  InstaFilters
//
//  Created by Di Wu on 2/29/12.
//  Copyright (c) 2012 twitter:@diwup. All rights reserved.
//

#import "UIImage+IF.h"

CGFloat RadiansOfDegrees(CGFloat degrees) {return degrees * M_PI / 180;};

@implementation UIImage (IF)

- (UIImage *)cropImageWithBounds:(CGRect)bounds {

    UIImage *tmpImage = [UIImage imageWithCGImage:self.CGImage scale:1.0f orientation:UIImageOrientationUp];

    if ((self.imageOrientation == UIImageOrientationUp) || (self.imageOrientation == UIImageOrientationUpMirrored)) {
    } else if ((self.imageOrientation == UIImageOrientationLeft) || (self.imageOrientation == UIImageOrientationLeftMirrored)) {
        tmpImage = [tmpImage imageRotatedByDegrees:-90.0f];
        
    } else if ((self.imageOrientation == UIImageOrientationRight) || (self.imageOrientation == UIImageOrientationRightMirrored)) {
        tmpImage = [tmpImage imageRotatedByDegrees:90.0f];
        
    } else if ((self.imageOrientation == UIImageOrientationDown) || (self.imageOrientation == UIImageOrientationDownMirrored)) {
        tmpImage = [tmpImage imageRotatedByDegrees:180.0f];
            
    }

    CGImageRef imageRef = CGImageCreateWithImageInRect([tmpImage CGImage], bounds);
    UIImage *croppedImage = [UIImage imageWithCGImage:imageRef];

    CGImageRelease(imageRef);

    return croppedImage;
}

- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees 
{   
    UIView *rotatedViewBox = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.size.width, self.size.height)];
    CGAffineTransform t = CGAffineTransformMakeRotation(RadiansOfDegrees(degrees));
    rotatedViewBox.transform = t;
    CGSize rotatedSize = rotatedViewBox.frame.size;
    
    UIGraphicsBeginImageContext(rotatedSize);
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    
    CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
    
    CGContextRotateCTM(bitmap, RadiansOfDegrees(degrees));
    
    CGContextScaleCTM(bitmap, 1.0, -1.0);
    CGContextDrawImage(bitmap, CGRectMake(-self.size.width / 2, -self.size.height / 2, self.size.width, self.size.height), [self CGImage]);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
    
}
@end

