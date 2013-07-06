//
//  ViewController.m
//  UIScrollViewZooming
//
//  Created by Dolice on 2013/07/06.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //スクロールビューを配置
    [self setScrollView];
}

- (void)setScrollView
{
    //スクロールビューの初期化
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    //スクロールビューに画像を設定
    UIImage *image = [UIImage imageNamed:@"Pandora_640_1136.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [scrollView addSubview:imageView];
    scrollView.contentSize = imageView.bounds.size;
    
    //スクロールビューを画面に貼り付け
    [self.view addSubview:scrollView];
    
    //拡大/縮小対応
    scrollView.delegate = (id)self;
    scrollView.minimumZoomScale = 0.1;
    scrollView.maximumZoomScale = 3.0;
}

//拡大/縮小対応
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    for (id subview in scrollView.subviews) {
        if ([subview isKindOfClass:[UIImageView class]]) {
            return subview;
        }
    }
    return nil;
}

@end
