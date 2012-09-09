//
//  ViewController.h
//  ScrollViewTest
//
//  Created by Fr@nk on 09/09/12.
//  Copyright (c) 2012 Fr@nk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate> {
	UIScrollView* scrollView;
	UIPageControl* pageControl;
    BOOL pageControlBeingUsed;
}

@property (nonatomic, retain) IBOutlet UIScrollView* scrollView;
@property (nonatomic, retain) IBOutlet UIPageControl* pageControl;


- (IBAction) changePage;

@end
