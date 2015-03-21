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
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // Add a background view for readability
    CGRect frame = CGRectMake(0, self.bounds.size.height - 20, self.bounds.size.width, 20);
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor blackColor];
    view.alpha = 0.5;
    [self.cellBackgroundImageView addSubview:view];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)updateInterfaceWithCity:(City *)city indexPath:(NSIndexPath *)indexPath {
    self.cityNameLabel.text = [NSString stringWithFormat:@"%ld. %@, %@", (long)indexPath.row + 1, city.name, city.country];
    self.populationLabel.text = city.population;
    self.cellBackgroundImageView.image = city.image;
}

@end
