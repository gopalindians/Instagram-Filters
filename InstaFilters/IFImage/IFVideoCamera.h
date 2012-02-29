//
//  IFVideoCamera.h
//  InstaFilters
//
//  Created by Di Wu on 2/28/12.
//  Copyright (c) 2012 twitter:@diwup. All rights reserved.
//

#import "GPUImage.h"

@interface IFVideoCamera : GPUImageVideoCamera

@property (strong, readonly) GPUImageView *gpuImageView;
@property (strong, readonly) GPUImageView *gpuImageView_HD;
@property (nonatomic, strong) UIImage *rawImage;

- (void)switchFilter:(IFFilterType)type;
- (void)cancelAlbumPhotoAndGoBackToNormal;
@end
