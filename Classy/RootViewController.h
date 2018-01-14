//  Copyright (c) 2014-2018 Natalie Hartman. All rights reserved.
#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (strong, nonatomic) NSArray *viewControllers;
- (IBAction)changePage:(id)sender;
@end
