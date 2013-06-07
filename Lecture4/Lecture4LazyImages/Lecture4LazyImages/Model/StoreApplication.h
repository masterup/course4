//
//  StoreApplication.h
//  Lecture4LazyImages
//
//  Created by Igor Tomych on 6/6/13.
//  Copyright (c) 2013 Igor Tomych. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface StoreApplication : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * imageURL;
@property (nonatomic, retain) NSManagedObject *image;

@end
