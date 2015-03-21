//
//  CityDetailViewController.m
//  ViewControllerInteractiveTransitionExample
//
//  Created by Serdar Karatekin on 3/20/15.
//  Copyright (c) 2015 Serdar Karatekin. All rights reserved.
//

#import "CityDetailViewController.h"
#import "CityListViewController.h"
#import "CityDetailToCityListTransitionAnimator.h"

@interface CityDetailViewController () <UINavigationControllerDelegate>

@property (nonatomic, weak) IBOutlet UITextView *textView;

@end

@implementation CityDetailViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cityImageView.image = self.city.image;
    self.textView.text = self.city.overview;
    self.textView.textColor = [UIColor whiteColor];
    self.title = self.city.name;    
}

- (void)viewDidAppear:(BOOL)animated {
    
    // Set ourself as the navigation controller's delegate so we're asked for a transitioning object
    self.navigationController.delegate = self;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    // Stop being the navigation controller's delegate
    if (self.navigationController.delegate == self) {
        self.navigationController.delegate = nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UINavigationControllerDelegate methods

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    // Check if we are transitioning from this view controller to a CityListViewController
    if (fromVC == self && [toVC isKindOfClass:[CityListViewController class]]) {
        return [[CityDetailToCityListTransitionAnimator alloc] init];
    }
    else {
        return nil;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
