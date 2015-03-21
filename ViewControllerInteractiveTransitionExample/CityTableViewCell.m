//
//  CityTableViewCell.m
//  ViewControllerInteractiveTransitionExample
//
//  Created by Serdar Karatekin on 3/20/15.
//  Copyright (c) 2015 Serdar Karatekin. All rights reserved.
//

#import "CityTableViewCell.h"

@implementation CityTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateInterfaceWithCity:(City *)city {
    self.cityNameLabel.text = city.name;
    self.populationLabel.text = city.population;
    self.cellBackgroundImageView.image = city.image;
}

@end
