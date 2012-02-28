//
//  IFVideoCamera.m
//  InstaFilters
//
//  Created by Di Wu on 2/28/12.
//  Copyright (c) 2012 twitter:@diwup. All rights reserved.
//

#import "InstaFilters.h"

@interface IFVideoCamera ()

@property (nonatomic, strong) IFSutroFilter *sutroFilter;
@property (nonatomic, strong) GPUImagePicture *sutroSourcePicture1;
@property (nonatomic, strong) GPUImagePicture *sutroSourcePicture2;
@property (nonatomic, strong) GPUImagePicture *sutroSourcePicture3;
@property (nonatomic, strong) GPUImagePicture *sutroSourcePicture4;
@property (nonatomic, strong) GPUImagePicture *sutroSourcePicture5;

@property (strong, readwrite) GPUImageView *gpuImageView;
@property (nonatomic, strong) IFRotationFilter *rotationFilter;

@end

@implementation IFVideoCamera

@synthesize sutroFilter;
@synthesize sutroSourcePicture1;
@synthesize sutroSourcePicture2;
@synthesize sutroSourcePicture3;
@synthesize sutroSourcePicture4;
@synthesize sutroSourcePicture5;

@synthesize gpuImageView;
@synthesize rotationFilter;

- (id)initWithSessionPreset:(NSString *)sessionPreset cameraPosition:(AVCaptureDevicePosition)cameraPosition {
	if (!(self = [super initWithSessionPreset:sessionPreset cameraPosition:cameraPosition]))
    {
		return nil;
    }    
    rotationFilter = [[IFRotationFilter alloc] initWithRotation:kGPUImageRotateRight];
    [self addTarget:rotationFilter];
    
    self.sutroFilter = [[IFSutroFilter alloc] init];
    self.sutroSourcePicture1 = [[GPUImagePicture alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"vignetteMap" ofType:@"png"]]];
    self.sutroSourcePicture2 = [[GPUImagePicture alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"sutroMetal" ofType:@"png"]]];
    self.sutroSourcePicture3 = [[GPUImagePicture alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"softLight" ofType:@"png"]]];
    self.sutroSourcePicture4 = [[GPUImagePicture alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"sutroEdgeBurn" ofType:@"png"]]];
    self.sutroSourcePicture5 = [[GPUImagePicture alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"sutroCurves" ofType:@"png"]]];
    
    [rotationFilter addTarget:sutroFilter];
    [sutroSourcePicture1 addTarget:sutroFilter];
    [sutroSourcePicture2 addTarget:sutroFilter];
    [sutroSourcePicture3 addTarget:sutroFilter];
    [sutroSourcePicture4 addTarget:sutroFilter];
    [sutroSourcePicture5 addTarget:sutroFilter];
    
    gpuImageView = [[GPUImageView alloc] initWithFrame:CGRectMake(0, 50, 320, 320)];
    gpuImageView.layer.contentsScale = 1.0f;
    [sutroFilter addTarget:gpuImageView];

    return self;
}


@end
