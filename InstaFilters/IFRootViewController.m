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

- (void)startButtonPressed:(id)sender;
- (void)startButtonTouched:(id)sender;
- (void)startButtonTouchCancelled:(id)sender;
@end

@implementation IFRootViewController

@synthesize startButton;

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
    //self.startButton.frame = CGRectMake(128, 415, 64, 45);
    self.startButton.frame = CGRectMake(128, 250, 64, 45);
    [self.startButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tabBar-camera" ofType:@"png"]] forState:UIControlStateNormal];
    self.startButton.adjustsImageWhenHighlighted = NO;
    [self.startButton addTarget:self action:@selector(startButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.startButton addTarget:self action:@selector(startButtonTouched:) forControlEvents:UIControlEventTouchDown];
    [self.startButton addTarget:self action:@selector(startButtonTouchCancelled:) forControlEvents:UIControlEventTouchCancel | UIControlEventTouchDragOutside];

    [self.view addSubview:self.startButton];
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

    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    __block IFFiltersViewController *filtersViewController = [[IFFiltersViewController alloc] init];
    [self presentViewController:filtersViewController animated:YES completion:^(){
        filtersViewController = nil;
        [self.startButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tabBar-camera" ofType:@"png"]] forState:UIControlStateNormal];

    }];
}
- (void)startButtonTouched:(id)sender {
    [self.startButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tabBar-camera-on" ofType:@"png"]] forState:UIControlStateNormal];

}
- (void)startButtonTouchCancelled:(id)sender {
    [self.startButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tabBar-camera" ofType:@"png"]] forState:UIControlStateNormal];

}



@end
