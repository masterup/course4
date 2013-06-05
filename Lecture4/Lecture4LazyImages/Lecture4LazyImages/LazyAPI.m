//
//  LazyAPI.m
//  Lecture4LazyImages
//
//  Created by Igor Tomych on 6/3/13.
//  Copyright (c) 2013 Igor Tomych. All rights reserved.
//

#import "LazyAPI.h"
#import "StoreApplication.h"

@implementation LazyAPI

+ (LazyAPI *)sharedClient {
    static LazyAPI *_sharedClient = nil;

    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        _sharedClient = [[LazyAPI alloc] initWithBaseURL:[NSURL URLWithString:@"http://phobos.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/"]];
        [_sharedClient registerHTTPOperationClass:[AFJSONRequestOperation class]];
        [_sharedClient setDefaultHeader:@"content-type" value:@"application/json"];
        [_sharedClient setDefaultHeader:@"Accept" value:@"application/json"];
    });
    
    return _sharedClient;
}

-(void)getTopApplicationWithSuccess:(void (^)())success andFail:(void (^)())fail {
    [self getPath:@"limit=100/json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray* results = [[NSMutableArray alloc] init];

        
        NSArray* rowApplications = [[responseObject objectForKey:@"feed"] objectForKey:@"entry"];
        
        for (int i = 0; i < [rowApplications count]; i++) {
            StoreApplication* application = [[StoreApplication alloc] init];
            
            application.name = [[[rowApplications objectAtIndex:i] objectForKey:@"im:name"] objectForKey:@"label"];
            application.imageURL = [[[[rowApplications objectAtIndex:i] objectForKey:@"im:image"] objectAtIndex:0] objectForKey:@"label"];
            
            [results addObject:application];
        }
        
        NSLog(@"%@", results);
        
        success(results);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        fail();
    }];
}
@end
