#import "RootViewController.h"

@implementation RootViewController
#define NUM_PAGES 2

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"classy" bundle:nil];
    UIViewController *classyViewController = [board instantiateViewControllerWithIdentifier:@"InSession"];
    UIViewController *dailyViewController = [board instantiateViewControllerWithIdentifier:@"Daily Schedule"];
    self.viewControllers = [[NSArray alloc] initWithObjects:classyViewController, dailyViewController, nil];
    CGRect scrollFrame = self.scrollView.frame;
    scrollFrame.origin.x = 0;
    scrollFrame.origin.y = 0;
    classyViewController.view.frame = scrollFrame;
    [self addChildViewController:classyViewController];
    [self.scrollView addSubview:classyViewController.view];
    [classyViewController didMoveToParentViewController:self];
    
    scrollFrame.origin.x = CGRectGetWidth(scrollFrame);
    dailyViewController.view.frame = scrollFrame;
    [self addChildViewController:dailyViewController];
    [self.scrollView addSubview:dailyViewController.view];
    [dailyViewController didMoveToParentViewController:self];

    // a page is the width of the scroll view
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.scrollView.frame) * NUM_PAGES, CGRectGetHeight(self.scrollView.frame)*2);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.scrollsToTop = NO;
    self.scrollView.delegate = self;
    
    self.pageControl.numberOfPages = NUM_PAGES;
    self.pageControl.currentPage = 0;
}

// at the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = CGRectGetWidth(self.scrollView.frame);
    NSUInteger page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}

- (void)gotoPage:(BOOL)animated
{
    NSInteger page = self.pageControl.currentPage;

	// update the scroll view to the appropriate page
    CGRect bounds = self.scrollView.bounds;
    bounds.origin.x = CGRectGetWidth(bounds) * page;
    bounds.origin.y = 0;
    [self.scrollView scrollRectToVisible:bounds animated:animated];
}
// disable vertical scrolling
- (void)scrollViewDidScroll:(UIScrollView *) scrollView
{
    [scrollView setContentOffset: CGPointMake(scrollView.contentOffset.x, 0)];
}

- (IBAction)changePage:(id)sender
{
    [self gotoPage:YES];    // YES = animate
}

@end
