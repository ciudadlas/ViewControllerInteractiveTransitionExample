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
//    NSLog(@"%@", CGRectCreateDictionaryRepresentation(view.frame));

}

- (CAGradientLayer*) blueGradient {
    
    UIColor *colorOne = [UIColor colorWithRed:(120/255.0) green:(135/255.0) blue:(150/255.0) alpha:1.0];
    UIColor *colorTwo = [UIColor colorWithRed:(57/255.0)  green:(79/255.0)  blue:(96/255.0)  alpha:1.0];
    
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, nil];
    NSNumber *stopOne = [NSNumber numberWithFloat:0.0];
    NSNumber *stopTwo = [NSNumber numberWithFloat:1.0];
    
    NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo, nil];
    
    CAGradientLayer *headerLayer = [CAGradientLayer layer];
    headerLayer.colors = colors;
    headerLayer.locations = locations;
    
    return headerLayer;
    
}

- (void)addGradientToView:(UIView *)view
{
    // Create a gradient layer that goes transparent -&gt; opaque
    CAGradientLayer *alphaGradientLayer = [CAGradientLayer layer];
    NSArray *colors = [NSArray arrayWithObjects:
                       (id)[[UIColor colorWithWhite:0 alpha:0] CGColor],
                       (id)[[UIColor colorWithWhite:0 alpha:1] CGColor],
                       nil];
    [alphaGradientLayer setColors:colors];
    
    // Start the gradient at the bottom and go almost half way up.
    [alphaGradientLayer setStartPoint:CGPointMake(0.0f, 0.0f)];
    [alphaGradientLayer setEndPoint:CGPointMake(0.0f, 0.0f)];
    
    // Create a image view for the topImage we created above and apply the mask
//    UIImageView *statusBarView = [[UIImageView alloc] initWithImage:topImage];
//    [alphaGradientLayer setFrame:[statusBarView bounds]];
    
    // Finally, add the masked image view on top of our collection view
//    [view addSubview:statusBarView];
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
