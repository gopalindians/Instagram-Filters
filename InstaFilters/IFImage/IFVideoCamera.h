//
//  IFVideoCamera.h
//  InstaFilters
//
//  Created by Di Wu on 2/28/12.
//  Copyright (c) 2012 twitter:@diwup. All rights reserved.
//

#import "GPUImage.h"

@class IFVideoCamera;

@protocol IFVideoCameraDelegate <NSObject>

- (void)IFVideoCameraWillStartCaptureStillImage:(IFVideoCamera *)videoCamera;
- (void)IFVideoCameraDidFinishCaptureStillImage:(IFVideoCamera *)videoCamera;

@end

@interface IFVideoCamera : GPUImageVideoCamera

@property (strong, readonly) GPUImageView *gpuImageView;
@property (strong, readonly) GPUImageView *gpuImageView_HD;
@property (nonatomic, strong) UIImage *rawImage;
@property (nonatomic, unsafe_unretained) id delegate;

- (void)switchFilter:(IFFilterType)type;
- (void)cancelAlbumPhotoAndGoBackToNormal;
- (void)takePhoto;
@end
