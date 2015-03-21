//
//  CityDetailViewController.h
//  ViewControllerInteractiveTransitionExample
//
//  Created by Serdar Karatekin on 3/20/15.
//  Copyright (c) 2015 Serdar Karatekin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@interface CityDetailViewController : UIViewController

@property (nonatomic, strong) City *city;
@property (nonatomic, weak) IBOutlet UIImageView*cityImageView;

@end
