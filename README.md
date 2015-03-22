# ViewControllerInteractiveTransitionExample

![ScreenShot](/Screenshot/example.gif)

This is an example of how to create a custom and interactive transition when switching between view controllers. On a high level, there are 3 steps to building the animation. For implementation details please review the source code until I have a more detailed write-up.

#### 1. Creating the basic list and detail view controllers
We start off with creating a view controller, `CityListViewController`, that holds our table view with a custom table view cell, `CityTableViewCell`. The `City` class provides the data for the application from the `City.plist` file included in the app.

We then create the detail view controller, `CityDetailViewController`. When the user clicks a row in the table view, this view controller gets pushed onto the view stack.

#### 2. Creating the custom animations
Once we have the table view and the detail views in place, it's time to create the custom animations for the pushing and popping of the views.

The animations will be managed by objects that conform to the `UIViewControllerAnimatedTransitioning` protocol. We create 2 classes that conform to this protocol, one for pushing the detail view controller, `CityListToCityDetailTransitionAnimator`, and for popping the detail view controller, `CityDetailToCityListTransitionAnimator`. The two required methods these classes implement from the `UIViewControllerAnimatedTransitioning` protocol are  `animateTransition:` and `transitionDuration:`

Once these animator classes are in place, we have to tell our view controllers to use these when presenting view controllers. We set both view controllers as the delegate of their navigation controller so they are called to specify if they want to use a custom animation object. This is done in the `UINavigationControllorDelegate` protocol method 
`navigationController:animationControllerForOperation:fromViewController:toViewController:`

#### 3. Making the pop animation interactive
At this point we have the custom animations working in our app. Now, we want to make the user be able to interact with this transition animation.

To make the pop animation interactive, we add a gesutre recognizer for screen left edge panning on the detail view controller. We then update the `UIPercentDrivenInteractiveTransition` object when the gesture recognizer's action method is called. This updates the transition percentage of the view controller as the user pans.
