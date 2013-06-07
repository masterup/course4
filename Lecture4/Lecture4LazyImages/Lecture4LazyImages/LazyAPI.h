//
//  LazyAPI.h
//  Lecture4LazyImages
//
//  Created by Igor Tomych on 6/3/13.
//  Copyright (c) 2013 Igor Tomych. All rights reserved.
//

#import "AFHTTPClient.h"
#import "AFNetworking.h"
#import <CoreData/CoreData.h>

@interface LazyAPI : AFHTTPClient

@property (strong, nonatomic) NSManagedObjectContext* context;

-(void)getTopApplicationWithSuccess:(void (^)(NSArray* topApplication))success andFail:(void (^)())fail;
+(LazyAPI*)sharedClient;

@end
