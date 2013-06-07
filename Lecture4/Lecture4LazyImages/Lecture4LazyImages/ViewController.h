//
//  ViewController.h
//  Lecture4LazyImages
//
//  Created by Igor Tomych on 5/27/13.
//  Copyright (c) 2013 Igor Tomych. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface ViewController : UITableViewController

@property (strong, nonatomic) NSManagedObjectContext* context;

@end
