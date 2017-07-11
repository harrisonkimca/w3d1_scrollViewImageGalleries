//
//  ViewController.m
//  2w3d1_scrollViewImageGalleries
//
//  Created by Seantastic31 on 10/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *image1;
@property (strong, nonatomic) UIImageView *image2;
@property (strong, nonatomic) UIImageView *image3;
@property (strong, nonatomic) UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupScrollView];
    [self setupPageControl];
    self.scrollView.delegate = self;
}

- (void)setupScrollView
{
    [self.view addSubview:self.scrollView];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.scrollView.pagingEnabled = YES;
    
    self.image1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lighthouse-zoomed"]];
    self.image2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field"]];
    self.image3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lighthouse-night"]];
    
    [self.scrollView addSubview:self.image1];
    [self.scrollView addSubview:self.image2];
    [self.scrollView addSubview:self.image3];
    
    self.image1.translatesAutoresizingMaskIntoConstraints = NO;
    self.image2.translatesAutoresizingMaskIntoConstraints = NO;
    self.image3.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.image1.userInteractionEnabled = YES;
    self.image2.userInteractionEnabled = YES;
    self.image3.userInteractionEnabled = YES;
    
    self.image1.contentMode =UIViewContentModeScaleAspectFit;
    self.image2.contentMode =UIViewContentModeScaleAspectFit;
    self.image3.contentMode =UIViewContentModeScaleAspectFit;
    
    [self.image1.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [self.image2.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [self.image3.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    
    [self.image1.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    [self.image2.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    [self.image3.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    
    [self.image1.heightAnchor constraintEqualToAnchor:self.scrollView.heightAnchor].active = YES;
    [self.image2.heightAnchor constraintEqualToAnchor:self.scrollView.heightAnchor].active = YES;
    [self.image3.heightAnchor constraintEqualToAnchor:self.scrollView.heightAnchor].active = YES;
    
    [self.image1.widthAnchor constraintEqualToAnchor:self.scrollView.widthAnchor].active = YES;
    [self.image2.widthAnchor constraintEqualToAnchor:self.scrollView.widthAnchor].active = YES;
    [self.image3.widthAnchor constraintEqualToAnchor:self.scrollView.widthAnchor].active = YES;
    
    [self.image1.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor].active = YES;
    [self.image2.leadingAnchor constraintEqualToAnchor:self.image1.trailingAnchor].active = YES;
    [self.image3.leadingAnchor constraintEqualToAnchor:self.image2.trailingAnchor].active = YES;
    
    [self.image3.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active = YES;
}

- (void)setupPageControl
{
    self.pageControl = [UIPageControl new];
    [self.view addSubview:self.pageControl];
    [self.view bringSubviewToFront:self.pageControl];
    self.pageControl.backgroundColor = [UIColor blackColor];
    self.pageControl.alpha = 0.5;
    self.pageControl.numberOfPages = self.scrollView.subviews.count;
    CGRect frame = CGRectMake(0, self.view.bounds.size.height - 50, self.view.bounds.size.width, 50);
    self.pageControl.frame = frame;
}


@end
