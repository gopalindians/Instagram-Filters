//
//  IFFiltersViewController.m
//  InstaFilters
//
//  Created by Di Wu on 2/28/12.
//  Copyright (c) 2012 twitter:@diwup. All rights reserved.
//

#define kFilterImageViewTag 9999
#define kFilterImageViewContainerViewTag 9998
#define kBlueDotImageViewOffset 25.0f
#define kFilterCellHeight 72.0f 
#define kBlueDotAnimationTime 0.2f

#import "IFFiltersViewController.h"

@interface IFFiltersViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIImageView *cameraToolBarImageView;
@property (nonatomic, strong) UIImageView *cameraCaptureBarImageView;
@property (nonatomic, strong) UIButton *toggleFiltersButton;
@property (nonatomic, unsafe_unretained) BOOL isFiltersTableViewVisible;
@property (nonatomic, strong) UITableView *filtersTableView;
@property (nonatomic, strong) UIView *filterTableViewContainerView;
@property (nonatomic, strong) UIImageView *blueDotImageView;

- (void)backButtonPressed:(id)sender;
- (void)toggleFiltersButtonPressed:(id)sender;
@end

@implementation IFFiltersViewController

@synthesize backButton;
@synthesize backgroundImageView;
@synthesize cameraToolBarImageView;
@synthesize cameraCaptureBarImageView;
@synthesize toggleFiltersButton;
@synthesize isFiltersTableViewVisible;
@synthesize filtersTableView;
@synthesize filterTableViewContainerView;
@synthesize blueDotImageView;

#pragma mark - Filters TableView Delegate & Datasource methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kFilterCellHeight;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (([indexPath row] != [[[tableView indexPathsForVisibleRows] objectAtIndex:0] row]) && ([indexPath row] != [[[tableView indexPathsForVisibleRows] lastObject] row])) {
        
        CGRect cellRect = [tableView rectForRowAtIndexPath:indexPath];

        CGRect tempRect = self.blueDotImageView.frame;
        tempRect.origin.x = cellRect.origin.y - tableView.contentOffset.y + kBlueDotImageViewOffset;
        
        [UIView animateWithDuration:kBlueDotAnimationTime animations:^() {
            self.blueDotImageView.frame = tempRect;
        }completion:^(BOOL finished){
            // do nothing
        }];
        
        return;
    }
    
    if ([indexPath row] == [[[tableView indexPathsForVisibleRows] objectAtIndex:0] row]) {
        [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        
        CGRect tempRect = self.blueDotImageView.frame;
        tempRect.origin.x = kBlueDotImageViewOffset;
        
        [UIView animateWithDuration:kBlueDotAnimationTime animations:^() {
            self.blueDotImageView.frame = tempRect;
        }completion:^(BOOL finished){
            // do nothing
        }];
    } else {
        [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];

        CGRect tempRect = self.blueDotImageView.frame;
        tempRect.origin.x = [[UIScreen mainScreen] applicationFrame].size.width - (kFilterCellHeight - kBlueDotImageViewOffset - tempRect.size.width) - tempRect.size.width;
        
        [UIView animateWithDuration:kBlueDotAnimationTime animations:^() {
            self.blueDotImageView.frame = tempRect;
        }completion:^(BOOL finished){
            // do nothing
        }];
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *filtersTableViewCellIdentifier = @"filtersTableViewCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: filtersTableViewCellIdentifier];
    UIImageView *filterImageView;
    UIView *filterImageViewContainerView;
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:filtersTableViewCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        filterImageView = [[UIImageView alloc] initWithFrame:CGRectMake(7.5, -7.5, 57, 72)];
        filterImageView.transform = CGAffineTransformMakeRotation(M_PI/2);
        filterImageView.tag = kFilterImageViewTag;
        
        filterImageViewContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, 7, 57, 72)];
        filterImageViewContainerView.tag = kFilterImageViewContainerViewTag;
        [filterImageViewContainerView addSubview:filterImageView];
        
        [cell.contentView addSubview:filterImageViewContainerView];
    } else {
        filterImageView = (UIImageView *)[cell.contentView viewWithTag:kFilterImageViewTag];
    }
    
    switch ([indexPath row]) {
        case 0: {
            filterImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DSFilterTileNormal" ofType:@"png"]];

            break;
        }
        case 1: {
            filterImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DSFilterTileAmaro" ofType:@"png"]];
            
            break;
        }
        case 2: {
            filterImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DSFilterTileRise" ofType:@"png"]];
            
            break;
        }
        case 3: {
            filterImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DSFilterTileHudson" ofType:@"png"]];
            
            break;
        }
        case 4: {
            filterImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DSFilterTileXpro2" ofType:@"png"]];
            
            break;
        }
        case 5: {
            filterImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DSFilterTileSierra" ofType:@"png"]];
            
            break;
        }
        case 6: {
            filterImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DSFilterTileLomoFi" ofType:@"png"]];
            
            break;
        }
        case 7: {
            filterImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DSFilterTileEarlybird" ofType:@"png"]];
            
            break;
        }
        case 8: {
            filterImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DSFilterTileSutro" ofType:@"png"]];
            
            break;
        }
        case 9: {
            filterImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DSFilterTileToaster" ofType:@"png"]];
            
            break;
        }
        case 10: {
            filterImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DSFilterTileBrannan" ofType:@"png"]];
            
            break;
        }
        case 11: {
            filterImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DSFilterTileInkwell" ofType:@"png"]];
            
            break;
        }
        case 12: {
            filterImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DSFilterTileWalden" ofType:@"png"]];
            
            break;
        }
        case 13: {
            filterImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DSFilterTileHefe" ofType:@"png"]];
            
            break;
        }
        case 14: {
            filterImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DSFilterTileValencia" ofType:@"png"]];
            
            break;
        }
        case 15: {
            filterImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DSFilterTileNashville" ofType:@"png"]];
            
            break;
        }
        case 16: {
            filterImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DSFilterTile1977" ofType:@"png"]];
            
            break;
        }
        case 17: {
            filterImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DSFilterTileLordKelvin" ofType:@"png"]];
            break;
        }
            
        default: {
            filterImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DSFilterTileNormal" ofType:@"png"]];

            break;
        }
    }
    
    
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 18;
}


#pragma mark - UI Setup

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
    
    self.backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.backgroundImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"glCameraBackground" ofType:@"png"]];
    
    self.cameraToolBarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    self.cameraToolBarImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"glCameraToolbar" ofType:@"png"]];
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backButton.frame = CGRectMake(285, 10, 20, 20);
    [self.backButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"glCameraIconCancel" ofType:@"png"]] forState:UIControlStateNormal];
    self.backButton.adjustsImageWhenHighlighted = NO;
    self.backButton.showsTouchWhenHighlighted = YES;
    [self.backButton addTarget:self action:@selector(backButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    self.cameraCaptureBarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 426, 320, 54)];
    self.cameraCaptureBarImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"glCameraCaptureBar" ofType:@"png"]];
    
    self.toggleFiltersButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.toggleFiltersButton.frame = CGRectMake(270, 430, 40, 40);
    [self.toggleFiltersButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"glCameraHideFilters" ofType:@"png"]] forState:UIControlStateNormal];
    self.toggleFiltersButton.adjustsImageWhenHighlighted = NO;
    self.toggleFiltersButton.showsTouchWhenHighlighted = YES;
    [self.toggleFiltersButton addTarget:self action:@selector(toggleFiltersButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    self.isFiltersTableViewVisible = YES;
    
    self.filterTableViewContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, 354, 320, 72)];
    self.filterTableViewContainerView.backgroundColor = [UIColor clearColor];
    
    self.filtersTableView = [[UITableView alloc] initWithFrame:CGRectMake(124, -124, 72, 320) style:UITableViewStylePlain];
    self.filtersTableView.backgroundColor = [UIColor clearColor];
    self.filtersTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.filtersTableView.showsVerticalScrollIndicator = NO;
    self.filtersTableView.delegate = self;
    self.filtersTableView.dataSource = self;
    self.filtersTableView.transform	= CGAffineTransformMakeRotation(-M_PI/2);
    
    self.blueDotImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kBlueDotImageViewOffset, 61, 21, 11)];
    self.blueDotImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"glCameraSelectedFilter" ofType:@"png"]];
    
    [self.filterTableViewContainerView addSubview:self.blueDotImageView];
    [self.filterTableViewContainerView addSubview:self.filtersTableView];
    
    [self.view addSubview:self.backgroundImageView];
    [self.view addSubview:self.cameraToolBarImageView];
    [self.view addSubview:self.backButton];
    [self.view addSubview:self.cameraCaptureBarImageView];
    [self.view addSubview:self.toggleFiltersButton];
    [self.view addSubview:self.filterTableViewContainerView];

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

#pragma mark - Button methods

- (void)backButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^() {
        // do nothing
    }];
}

- (void)toggleFiltersButtonPressed:(id)sender {
    if (isFiltersTableViewVisible == YES) {
        [self.toggleFiltersButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"glCameraShowFilters" ofType:@"png"]] forState:UIControlStateNormal];
        self.isFiltersTableViewVisible = NO;
    } else {
        [self.toggleFiltersButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"glCameraHideFilters" ofType:@"png"]] forState:UIControlStateNormal];
        self.isFiltersTableViewVisible = YES;
    }
}


#pragma mark - View Will/Did Appear/Disappear
- (void)viewWillAppear:(BOOL)animated {
    //[[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
}
- (void)viewWillDisappear:(BOOL)animated {
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
}


@end
