//
//  ViewController.h
//  iHakulaImageViewTesting
//
//  Created by Wei Wayde Sun on 8/31/15.
//  Copyright (c) 2015 ihakula. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iHImageSlideView.h"
#import "iHPageView.h"
#import "iHStretchableView.h"
#import "iHAdditions.h"
#import "iHCommonMacros.h"


@interface ViewController : UIViewController <ImageSliderViewDelegate> {
    iHImageSlideView *_slideImageView;
    iHPageView *_pageView;
}

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIView *stretchView;
@property (nonatomic, strong) iHStretchableView* stretchableTableHeaderView;


@end

