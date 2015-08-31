//
//  ViewController.m
//  iHakulaImageViewTesting
//
//  Created by Wei Wayde Sun on 8/31/15.
//  Copyright (c) 2015 ihakula. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSlideStretchView];
}

#pragma mark - Scrollview delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_stretchableTableHeaderView scrollViewDidScroll:scrollView];
    _pageView.top = _stretchView.top + _stretchView.height - 30;
    NSLog(@"%@", _pageView);
}

- (void)viewDidLayoutSubviews
{
    [_stretchableTableHeaderView resizeView];
}

- (void)initSlideStretchView {
    if (_slideImageView) {
        [_slideImageView removeFromSuperview];
        [_pageView removeFromSuperview];
    }
    
    NSMutableArray *imageUrls = nil;
    
    imageUrls = [NSMutableArray arrayWithObjects:
                 @"testcarbrand0.png",
                 @"testcarbrand1.png",
                 @"testcarbrand2.png",
                 @"testcarbrand3.png",
                 @"testcarbrand4.png",
                 nil];
    
    NSLog(@"%@", self.stretchView);
    _slideImageView = [[iHImageSlideView alloc] initWithFrame:CGRectMake(0, 0, self.stretchView.width, 260)];
    _slideImageView.delegate = self;
    [self.stretchView addSubview:_slideImageView];
    [_slideImageView setImageUrls:imageUrls];
    
    _pageView = [[iHPageView alloc] initWithPageNum:5];
    _pageView.top = _slideImageView.bottom - 28;
    _pageView.left = (IH_DEVICE_WIDTH - _pageView.width)/2.0f ;
    _pageView.backgroundColor = [UIColor yellowColor];
    
    [self.stretchView addSubview:_pageView];
    
    _stretchableTableHeaderView = [iHStretchableView new];
    [_stretchableTableHeaderView stretchHeaderForTableView:self.tableview withView:_stretchView];
    
    [self.tableview addSubview:_pageView];
    
    CGSize size = _slideImageView.scrollView.size;
    _slideImageView.scrollView.contentSize = CGSizeMake(5 * IH_DEVICE_WIDTH, size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"PriceCell"];

    return cell;
}

#pragma mark - ImageSliderViewDelegate

- (void)imageClickedWithIndex:(int)imageIndex{
    NSLog(@"image clicked at index:%d",imageIndex);
}

- (void)imageDidEndDeceleratingWithIndex:(int)imageIndex{
    NSLog(@"image clicked at index:%d",imageIndex);
    [_pageView setCurrentPage:imageIndex];

}

@end
