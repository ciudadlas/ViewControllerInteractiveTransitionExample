//
//  CityListViewController.h
//  ViewControllerInteractiveTransitionExample
//
//  Created by Serdar Karatekin on 3/20/15.
//  Copyright (c) 2015 Serdar Karatekin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CityTableViewCell;
@class City;

@interface CityListViewController : UIViewController

- (CityTableViewCell *)tableViewCellForCity:(City *)city;

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

