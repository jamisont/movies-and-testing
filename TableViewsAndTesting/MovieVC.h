//
//  MovieVC.h
//  TableViewsAndTesting
//
//  Created by Tatiana Jamison on 10/22/15.
//  Copyright © 2015 Bit Lore Institute. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieVC : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelMovieDescription;
@property (strong, nonatomic) Movie *movieToWatch;

@end
