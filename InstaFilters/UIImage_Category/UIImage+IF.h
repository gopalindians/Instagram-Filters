//
//  UIImage+IF.h
//  InstaFilters
//
//  Created by Di Wu on 2/29/12.
//  Copyright (c) 2012 twitter:@diwup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (IF)

- (UIImage *)cropImageWithBounds:(CGRect)bounds;
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

@end
