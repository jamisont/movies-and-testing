//
//  Movie.m
//  TableViewsAndTesting
//
//  Created by Tatiana Jamison on 10/22/15.
//  Copyright © 2015 Bit Lore Institute. All rights reserved.
//

#import "Movie.h"

@implementation Movie

+ (Movie *)movie:(NSString *)movieTitle description:(NSString *)movieDescription
{
    Movie *newMovie = [[Movie alloc] init];
    
    newMovie.titleCustom = movieTitle;
    newMovie.descriptionCustom = movieDescription;
    
    return newMovie;
}

@end
