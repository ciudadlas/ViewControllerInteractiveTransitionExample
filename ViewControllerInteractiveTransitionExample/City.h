//
//  City.h
//  ViewControllerInteractiveTransitionExample
//
//  Created by Serdar Karatekin on 3/20/15.
//  Copyright (c) 2015 Serdar Karatekin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface City : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *country;
@property (nonatomic, copy, readonly) NSString *population;
@property (nonatomic, copy, readonly) NSString *overview;
@property (nonatomic, strong) UIImage *image;

- (instancetype)initWithName:(NSString*)name population:(NSString *)population overview:(NSString *)overview country:(NSString *)country image:(UIImage *)image;
+ (NSArray *)mostPopulatedCities;

@end
