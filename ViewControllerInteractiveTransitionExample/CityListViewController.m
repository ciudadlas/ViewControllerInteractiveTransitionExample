//
//  CityListViewController.h
//  ViewControllerInteractiveTransitionExample
//
//  Created by Serdar Karatekin on 3/20/15.
//  Copyright (c) 2015 Serdar Karatekin. All rights reserved.
//

#import "CityListViewController.h"
#import "City.h"
#import "CityTableViewCell.h"
#import "CityDetailViewController.h"

@interface CityListViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *cities;

@end

@implementation CityListViewController

#pragma mark - View Lifecycle

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _cities = [City mostPopulatedCities];
        self.title = @"Most Populated Cities";
        NSLog(@"Cities loaded: %@", _cities);
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[CityDetailViewController class]]) {
        
        // Get the selected row index path
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        
        // Set the city on the view controller we're about to show
        if (selectedIndexPath != nil) {
            CityDetailViewController *cityDetailViewController = segue.destinationViewController;
            cityDetailViewController.city = self.cities[selectedIndexPath.row];
        }
    }
}

#pragma mark - UITableViewDataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityCell" forIndexPath:indexPath];
    City *city = [self.cities objectAtIndex:indexPath.row];
    
    [cell updateInterfaceWithCity:city];
    return cell;
}

@end
