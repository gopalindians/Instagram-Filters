//
//  IFRootViewController.m
//  InstaFilters
//
//  Created by Di Wu on 2/28/12.
//  Copyright (c) 2012 twitter:@diwup. All rights reserved.
//

#import "IFRootViewController.h"

@interface IFRootViewController ()

@property (nonatomic, strong) UIButton *startButton;

- (void)startButtonPressed:(id)sender;

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
    self.view.backgroundColor = [UIColor grayColor];
    self.startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.startButton.frame = CGRectMake(100, 100, 80, 40);
    [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
    [self.startButton addTarget:self action:@selector(startButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
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
    
}


@end
