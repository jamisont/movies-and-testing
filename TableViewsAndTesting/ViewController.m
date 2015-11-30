//
//  ViewController.m
//  TableViewsAndTesting
//
//  Created by Tatiana Jamison on 10/22/15.
//  Copyright © 2015 Bit Lore Institute. All rights reserved.
//

#import "ViewController.h"
#import "Movie.h"
#import "MovieVC.h"

@interface ViewController ()

{
    NSMutableArray *arrayOfMovies;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    arrayOfMovies = [[NSMutableArray alloc] initWithObjects:
                     [Movie movie:@"Back to the Future" description:@"88 mph"],
                     [Movie movie:@"Back to the Future II" description:@"where we're going, we don't need roads"],
                     [Movie movie:@"Back to the Future III" description:@"now in the past"],
                     nil];
    
    self.tableView.accessibilityIdentifier = @"myTableView";
    self.navigationItem.titleView.accessibilityIdentifier = @"myNavigationControllerTitleView";
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    
    if (selectedIndexPath) {
        MovieVC *mvc = [segue destinationViewController];
        mvc.movieToWatch = arrayOfMovies[selectedIndexPath.row];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    Movie *currentMovie = arrayOfMovies[indexPath.row];
    cell.textLabel.text = currentMovie.titleCustom;
    cell.textLabel.accessibilityIdentifier = [NSString stringWithFormat:@"movieIdentifier_%ld", (long)indexPath.row];
    
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayOfMovies count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"displayMovie" sender:self];
}

@end
