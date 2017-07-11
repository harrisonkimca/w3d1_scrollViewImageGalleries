//
//  ViewController.m
//  2w3d1_scrollViewImageGalleries
//
//  Created by Seantastic31 on 10/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "ViewController.h"
#import "DetailedViewController.h"

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
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTapped:)]; // *** main
    [self.scrollView addGestureRecognizer:tapGesture]; // *** main
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int currentPage = (int)self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    self.pageControl.currentPage = currentPage;
}

- (void)viewTapped:(UIGestureRecognizer*)sender
{
    [self performSegueWithIdentifier:@"showDetailImage" sender:sender];
    
//    CGPoint location = [sender locationInView:self.scrollView]; // way to figure out which recognizer
//    UIView *view = [self.scrollView hitTest:location withEvent:nil];
//    
//    if ([view isKindOfClass:[UIImage class]]) // way to figure out
//    {
//        UIImageView *imageView = (UIImageView *)view;
//        UIImage *myImage = imageView.image;
//        
//        if(myImage)
//        {
//            [self performSegueWithIdentifier:@"showDetailImage" sender:sender]; // *** send image to prepare for segue
//        }
//    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetailImage"])
    {
        DetailedViewController *target = [segue destinationViewController];
        
        CGPoint location= [sender locationInView:self.scrollView];
        int image = location.x/self.scrollView.frame.size.width;
        
        if (image == 0)
        {
            // remember .image to drill down to UIImage
            target.myImage = self.image1.image;
        }
        else if (image == 1)
        {
            target.myImage = self.image2.image;
        } else
        {
            target.myImage = self.image3.image;
        }
    }
}
        
    
//    if ([segue.identifier isEqualToString:@"showDetailImage"])
//    {
//        DetailedViewController *detailedVC = [segue destinationViewController]; // ***
//        
//        if ([sender isKindOfClass:[UIImage class]])
//        {
//            detailedVC.myImage = sender; // *** main
//        }
//    }
//}

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
    //self.pageControl.numberOfPages = self.scrollView.subviews.count;
    self.pageControl.numberOfPages = 3;
    CGRect frame = CGRectMake(0, self.view.bounds.size.height - 50, self.view.bounds.size.width, 50);
    self.pageControl.frame = frame;
}


@end
