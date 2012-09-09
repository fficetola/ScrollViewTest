//
//  ViewController.m
//  ScrollViewTest
//
//  Created by Fr@nk on 09/09/12.
//  Copyright (c) 2012 Fr@nk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize scrollView, pageControl;





// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
     
	pageControlBeingUsed = NO;
    
	//NSArray *colors = [NSArray arrayWithObjects:[UIColor redColor], [UIColor greenColor], [UIColor blueColor], nil];
    int totalPanel = 3;
    
	for (int i = 0; i <totalPanel; i++) {
		CGRect frame;
		frame.origin.x = self.scrollView.frame.size.width * i;
		frame.origin.y = 0;
		frame.size = self.scrollView.frame.size;
        
		UIView *subview = [[UIView alloc] initWithFrame:frame];
        
        NSString *imageName = [NSString stringWithFormat:@"%@%d%@", @"aboutus", i, @".png"];
        //DLog(@"imageName %@",imageName);
        
        subview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:imageName]];
		//subview.backgroundColor = [colors objectAtIndex:i];
        //subview.backgroundColor = [UIColor grayColor];
        //subview.alpha = 0.5; // Yes, this should be 0.5. The background should be a bit lucid
        subview.opaque = NO;
		[self.scrollView addSubview:subview];
		[subview release];
	}
    
	self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * totalPanel, self.scrollView.frame.size.height);
    
	self.pageControl.currentPage = 0;
	self.pageControl.numberOfPages = totalPanel;
    
    
    /*NSString *resourcePath = [[NSBundle mainBundle]pathForResource:@"filmato" ofType:@"mp4"];
     NSURL *link = [NSURL fileURLWithPath:resourcePath];
     MPMoviePlayerController *movie = [[MPMoviePlayerController alloc] initWithContentURL:link];
     
     [movie setBackgroundColor:[UIColor blackColor]];
     [movie setScalingMode:MPMovieScalingModeAspectFit];
     
     [movie play];
     */
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
	if (!pageControlBeingUsed) {
		// Switch the indicator when more than 50% of the previous/next page is visible
		CGFloat pageWidth = self.scrollView.frame.size.width;
		int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
		self.pageControl.currentPage = page;
	}
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
	pageControlBeingUsed = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
	pageControlBeingUsed = NO;
}

- (IBAction)changePage {
	// Update the scroll view to the appropriate page
	CGRect frame;
	frame.origin.x = self.scrollView.frame.size.width * self.pageControl.currentPage;
	frame.origin.y = 0;
	frame.size = self.scrollView.frame.size;
	[self.scrollView scrollRectToVisible:frame animated:YES];
    
	// Keep track of when scrolls happen in response to the page control
	// value changing. If we don't do this, a noticeable "flashing" occurs
	// as the the scroll delegate will temporarily switch back the page
	// number.
	pageControlBeingUsed = YES;
}





- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
