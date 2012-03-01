//
//  IFRootViewController.m
//  InstaFilters
//
//  Created by Di Wu on 2/28/12.
//  Copyright (c) 2012 twitter:@diwup. All rights reserved.
//

#import "IFRootViewController.h"
#import "IFFiltersViewController.h"

@interface IFRootViewController ()

@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) UIButton *lowQualityVideoButton;
@property (nonatomic, strong) UIButton *highQualityVideoButton;
- (void)startButtonPressed:(id)sender;
- (void)startButtonTouched:(id)sender;
- (void)startButtonTouchCancelled:(id)sender;
@end

@implementation IFRootViewController

@synthesize startButton;
@synthesize lowQualityVideoButton;
@synthesize highQualityVideoButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    // If you create your views manually, you MUST override this method and use it to create your views.
    // If you use Interface Builder to create your views, then you must NOT override this method.
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    self.view.backgroundColor = [UIColor whiteColor];
    self.startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.startButton.tag = 1;
    self.startButton.frame = CGRectMake(128, 250, 64, 45);
    [self.startButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tabBar-camera" ofType:@"png"]] forState:UIControlStateNormal];
    self.startButton.adjustsImageWhenHighlighted = NO;
    [self.startButton addTarget:self action:@selector(startButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.startButton addTarget:self action:@selector(startButtonTouched:) forControlEvents:UIControlEventTouchDown];
    [self.startButton addTarget:self action:@selector(startButtonTouchCancelled:) forControlEvents:UIControlEventTouchCancel | UIControlEventTouchDragOutside];

    self.lowQualityVideoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.lowQualityVideoButton.tag = 2;
    self.lowQualityVideoButton.frame = CGRectMake(128, 310, 64, 45);
    [self.lowQualityVideoButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tabBar-camera" ofType:@"png"]] forState:UIControlStateNormal];
    self.lowQualityVideoButton.adjustsImageWhenHighlighted = NO;
    [self.lowQualityVideoButton addTarget:self action:@selector(startButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.lowQualityVideoButton addTarget:self action:@selector(startButtonTouched:) forControlEvents:UIControlEventTouchDown];
    [self.lowQualityVideoButton addTarget:self action:@selector(startButtonTouchCancelled:) forControlEvents:UIControlEventTouchCancel | UIControlEventTouchDragOutside];

    self.highQualityVideoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.highQualityVideoButton.tag = 3;
    self.highQualityVideoButton.frame = CGRectMake(128, 370, 64, 45);
    [self.highQualityVideoButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tabBar-camera" ofType:@"png"]] forState:UIControlStateNormal];
    self.highQualityVideoButton.adjustsImageWhenHighlighted = NO;
    [self.highQualityVideoButton addTarget:self action:@selector(startButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.highQualityVideoButton addTarget:self action:@selector(startButtonTouched:) forControlEvents:UIControlEventTouchDown];
    [self.highQualityVideoButton addTarget:self action:@selector(startButtonTouchCancelled:) forControlEvents:UIControlEventTouchCancel | UIControlEventTouchDragOutside];

    
    [self.view addSubview:self.startButton];
    [self.view addSubview:self.lowQualityVideoButton];
    [self.view addSubview:self.highQualityVideoButton];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Start Button method
- (void)startButtonPressed:(id)sender {
    
    __block IFFiltersViewController *filtersViewController = [[IFFiltersViewController alloc] init];

    UIButton *aButton = (UIButton *)sender;
    
    switch (aButton.tag) {
        case 1: {
            filtersViewController.shouldLaunchAsAVideoRecorder = NO;
            filtersViewController.shouldLaunchAshighQualityVideo = NO;
            break;
        }
         
        case 2: {
            filtersViewController.shouldLaunchAsAVideoRecorder = YES;
            filtersViewController.shouldLaunchAshighQualityVideo = NO;
            break;
        }
        case 3: {
            filtersViewController.shouldLaunchAsAVideoRecorder = YES;
            filtersViewController.shouldLaunchAshighQualityVideo = YES;
            break;
        }
        default:
            break;
    }

    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    [self presentViewController:filtersViewController animated:YES completion:^(){
        filtersViewController = nil;
        [aButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tabBar-camera" ofType:@"png"]] forState:UIControlStateNormal];

    }];
}
- (void)startButtonTouched:(id)sender {
    UIButton *aButton = (UIButton *)sender;
    [aButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tabBar-camera-on" ofType:@"png"]] forState:UIControlStateNormal];

}
- (void)startButtonTouchCancelled:(id)sender {
    UIButton *aButton = (UIButton *)sender;
    [aButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tabBar-camera" ofType:@"png"]] forState:UIControlStateNormal];

}



@end
