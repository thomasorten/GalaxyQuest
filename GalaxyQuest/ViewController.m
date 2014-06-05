//
//  ViewController.m
//  GalaxyQuest
//
//  Created by Thomas Orten on 6/5/14.
//  Copyright (c) 2014 Orten, Thomas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@property UIImageView *imageView;
@property NSArray *imageViews;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.imageViews = @[[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mars.jpg"]],
                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"moon.jpg"]],
                        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sun.jpg"]]];

    int x = 0.0;
    for (UIImageView *imageView in self.imageViews) {
        [self.myScrollView addSubview:imageView];
        imageView.frame = CGRectMake(x, 0, self.view.frame.size.width, self.view.frame.size.height);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        x += imageView.frame.size.width;
    }

    self.myScrollView.contentSize = CGSizeMake(x, self.myScrollView.frame.size.height);
    self.myScrollView.minimumZoomScale = 0.5;
    self.myScrollView.maximumZoomScale = 6.0;
    self.myScrollView.delegate = self;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
