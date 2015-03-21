//
//  CityTableViewCell.h
//  ViewControllerInteractiveTransitionExample
//
//  Created by Serdar Karatekin on 3/20/15.
//  Copyright (c) 2015 Serdar Karatekin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@interface CityTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *cityNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *populationLabel;
@property (nonatomic, weak) IBOutlet UIImageView *cellBackgroundImageView;

- (void)updateInterfaceWithCity:(City *)city;

@end
