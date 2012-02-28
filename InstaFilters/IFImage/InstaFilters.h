//
//  InstaFilters.h
//  InstaFilters
//
//  Created by Di Wu on 2/28/12.
//  Copyright (c) 2012 twitter:@diwup. All rights reserved.
//

typedef enum { 
    IF_NORMAL_FILTER,
    IF_AMARO_FILTER,
    IF_SUTRO_FILTER,
    IF_FILTER_TOTAL_NUMBER
} IFFilterType; 

#import "IFImageFilter.h"
#import "IFVideoCamera.h"
#import "IFSutroFilter.h"
#import "IFRotationFilter.h"
#import "IFAmaroFilter.h"