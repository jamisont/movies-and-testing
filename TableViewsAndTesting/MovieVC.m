//
//  MovieVC.m
//  TableViewsAndTesting
//
//  Created by Tatiana Jamison on 10/22/15.
//  Copyright © 2015 Bit Lore Institute. All rights reserved.
//

#import "MovieVC.h"

@interface MovieVC ()

@end

@implementation MovieVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.labelMovieDescription.text = self.movieToWatch.descriptionCustom;

    self.navigationItem.title = self.movieToWatch.titleCustom;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
