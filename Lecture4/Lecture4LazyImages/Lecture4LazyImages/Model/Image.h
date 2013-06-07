//
//  Image.h
//  Lecture4LazyImages
//
//  Created by Igor Tomych on 6/6/13.
//  Copyright (c) 2013 Igor Tomych. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class StoreApplication;

@interface Image : NSManagedObject

@property (nonatomic, retain) id image;
@property (nonatomic, retain) StoreApplication *storeApplication;

@end
