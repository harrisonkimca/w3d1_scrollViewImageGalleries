//
//  DetailedViewController.m
//  2w3d1_scrollViewImageGalleries
//
//  Created by Seantastic31 on 10/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "DetailedViewController.h"

@interface DetailedViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation DetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpScrollView];
    self.scrollView.delegate = self;
}

- (void)setUpScrollView
{
    [self.view addSubview:self.scrollView];
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageView.userInteractionEnabled = YES;
    
    self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lighthouse-zoomed"]];
    [self.scrollView addSubview:self.imageView];

    [self.imageView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [self.imageView.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    [self.imageView.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor].active = YES;
    [self.imageView.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active = YES;
    
    // 
    self.scrollView.contentSize = self.imageView.bounds.size;
    self.scrollView.minimumZoomScale = 0.5;
    self.scrollView.maximumZoomScale = 2.0;
    
    self.scrollView.zoomScale = 0.5;
    self.scrollView.contentOffset = CGPointMake(500, 500);
}

- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

@end
