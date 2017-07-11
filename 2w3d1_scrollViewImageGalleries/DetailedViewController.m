//
//  DetailedViewController.m
//  2w3d1_scrollViewImageGalleries
//
//  Created by Seantastic31 on 10/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "DetailedViewController.h"

@interface DetailedViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *detailedScrollView;
@property (strong, nonatomic) UIImageView *detailedImageView;

@end

@implementation DetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpDetailedScrollView];
    self.detailedScrollView.delegate = self;
}

- (void)setUpDetailedScrollView
{
    [self.view addSubview:self.detailedScrollView];
    self.detailedImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.detailedImageView.userInteractionEnabled = YES;
    
    // replace hardcoded picture with myImage property now
    self.detailedImageView = [[UIImageView alloc]initWithImage:self.myImage];
    [self.detailedScrollView addSubview:self.detailedImageView];

    [self.detailedImageView.topAnchor constraintEqualToAnchor:self.detailedScrollView.topAnchor].active = YES;
    [self.detailedImageView.bottomAnchor constraintEqualToAnchor:self.detailedScrollView.bottomAnchor].active = YES;
    [self.detailedImageView.leadingAnchor constraintEqualToAnchor:self.detailedScrollView.leadingAnchor].active = YES;
    [self.detailedImageView.trailingAnchor constraintEqualToAnchor:self.detailedScrollView.trailingAnchor].active = YES;
    
    // set the content size
    self.detailedScrollView.contentSize = self.detailedImageView.bounds.size;
    self.detailedScrollView.minimumZoomScale = 0.5;
    self.detailedScrollView.maximumZoomScale = 2.0;
    
    self.detailedScrollView.zoomScale = 0.5;
    self.detailedScrollView.contentOffset = CGPointMake(500, 500);
}

- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.detailedImageView;
}

@end
