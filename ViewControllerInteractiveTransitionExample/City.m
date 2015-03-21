//
//  City.m
//  ViewControllerInteractiveTransitionExample
//
//  Created by Serdar Karatekin on 3/20/15.
//  Copyright (c) 2015 Serdar Karatekin. All rights reserved.
//

#import "City.h"

@implementation City

- (instancetype)initWithName:(NSString*)name population:(NSString *)population overview:(NSString *)overview country:(NSString *)country image:(UIImage *)image {
    
    self = [super init];
    
    if (self) {
        _name = [name copy];
        _country = [country copy];
        _population = [population copy];
        _overview = [overview copy];
        _image = image;
    }
    
    return self;
}

+ (NSArray *)mostPopulatedCities {
    NSArray *citiesData = [self getData];
    return [self parseData:citiesData];
}

+ (NSArray *)getData {
    // Source: http://en.wikipedia.org/wiki/List_of_cities_proper_by_population
    
   return [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Cities" ofType:@"plist"]];
}

+ (NSArray *)parseData:(NSArray *)data {
    
    NSMutableArray *cities = [[NSMutableArray alloc] init];
    
    for (NSDictionary *city in data) {
        
        NSString *name = [city objectForKey:@"name"];
        NSString *population = [city objectForKey:@"population"];
        NSString *overview = [city objectForKey:@"overview"];
        NSString *country = [city objectForKey:@"country"];
        NSString *imageName = [city objectForKey:@"imageName"];
        
        City *newCity = [[City alloc] initWithName:name
                                        population:population
                                          overview:overview
                                           country:country
                                             image:[UIImage imageNamed:imageName]];
        
        [cities addObject:newCity];
    }
    
    return [NSArray arrayWithArray:cities];
}

@end
