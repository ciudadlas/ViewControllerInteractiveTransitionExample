//
//  CityListToCityDetailTransitionController.m
//  ViewControllerInteractiveTransitionExample
//
//  Created by Serdar Karatekin on 3/21/15.
//  Copyright (c) 2015 Serdar Karatekin. All rights reserved.
//

#import "CityListToCityDetailTransitionAnimator.h"
#import "CityListViewController.h"
#import "CityDetailViewController.h"
#import "CityTableViewCell.h"

@implementation CityListToCityDetailTransitionAnimator

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    CityListViewController *fromViewController = (CityListViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    CityDetailViewController *toViewController = (CityDetailViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    // Get a snapshot of the city cell we are transitioning from
    CityTableViewCell *cell = (CityTableViewCell *)[fromViewController.tableView cellForRowAtIndexPath:[fromViewController.tableView indexPathForSelectedRow]];
    UIView *cellImageSnapshot = [cell.cellBackgroundImageView snapshotViewAfterScreenUpdates:NO];
    cellImageSnapshot.frame = [containerView convertRect:cell.cellBackgroundImageView.frame fromView:cell.cellBackgroundImageView.superview];
    cell.cellBackgroundImageView.hidden = YES;
    
    // Setup the initial view states
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.alpha = 0;
    toViewController.cityImageView.hidden = YES;
    
    [containerView addSubview:toViewController.view];
    [containerView addSubview:cellImageSnapshot];
    
    [UIView animateWithDuration:duration animations:^{
        // Fade in the second view controller's view
        toViewController.view.alpha = 1.0;
        
        // Move the cell snapshot so it's over the second view controller's image view
        CGRect frame = [containerView convertRect:toViewController.cityImageView.frame fromView:toViewController.view];
        cellImageSnapshot.frame = frame;
        
    } completion:^(BOOL finished) {
        // Clean up
        toViewController.cityImageView.hidden = NO;
        cell.hidden = NO;
        [cellImageSnapshot removeFromSuperview];
        
        // Declare that we've finished
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

@end
