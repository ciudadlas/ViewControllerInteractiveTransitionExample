//
//  CityDetailToCityListTransitionAnimator.m
//  ViewControllerInteractiveTransitionExample
//
//  Created by Serdar Karatekin on 3/21/15.
//  Copyright (c) 2015 Serdar Karatekin. All rights reserved.
//

#import "CityDetailToCityListTransitionAnimator.h"
#import "CityListViewController.h"
#import "CityDetailViewController.h"
#import "CityTableViewCell.h"

@implementation CityDetailToCityListTransitionAnimator

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    CityDetailViewController *fromViewController = (CityDetailViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    CityListViewController *toViewController = (CityListViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    // Get a snapshot of the image view
    UIView *imageSnapshot = [fromViewController.cityImageView snapshotViewAfterScreenUpdates:NO];
    imageSnapshot.frame = [containerView convertRect:fromViewController.cityImageView.frame fromView:fromViewController.cityImageView.superview];
    fromViewController.cityImageView.hidden = YES;
    
    // Get the cell we will animate to
    CityTableViewCell *cell = [toViewController tableViewCellForCity:fromViewController.city];
    cell.cellBackgroundImageView.hidden = YES;
    
    // Setup the initial view states
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    [containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
    [containerView addSubview:imageSnapshot];
    
    [UIView animateWithDuration:duration animations:^{
        // Fade out the source view controller
        fromViewController.view.alpha = 0.0;
        
        // Move the image view
        imageSnapshot.frame = [containerView convertRect:cell.cellBackgroundImageView.frame fromView:cell.cellBackgroundImageView.superview];
    } completion:^(BOOL finished) {
        // Clean up
        [imageSnapshot removeFromSuperview];
        fromViewController.cityImageView.hidden = NO;
        cell.cellBackgroundImageView.hidden = NO;
        
        // Declare that we've finished
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.25;
}

@end
