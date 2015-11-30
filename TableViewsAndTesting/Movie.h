//
//  Movie.h
//  TableViewsAndTesting
//
//  Created by Tatiana Jamison on 10/22/15.
//  Copyright © 2015 Bit Lore Institute. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (strong, nonatomic) NSString *titleCustom;
@property (strong, nonatomic) NSString *descriptionCustom;

+ (Movie *)movie:(NSString *)movieTitle description:(NSString *)movieDescription;

@end
