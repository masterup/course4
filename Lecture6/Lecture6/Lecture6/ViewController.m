//
//  ViewController.m
//  Lecture6
//
//  Created by Igor Tomych on 6/3/13.
//  Copyright (c) 2013 Igor Tomych. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (void)doSomething;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

//    int multiplier = 7;
//    __block NSString* outputString = @"%d";
//    
//    int (^myBlock)(int) = ^(int num) {
//        int result = num * multiplier;
//        
//        outputString = @"result: %d";
//        NSLog(outputString, result);
//        return result;
//    };
//    
//    NSLog(outputString, 1);
//    myBlock(10);
//    
//    NSLog(outputString, 2);
    
    
    NSArray* testArray = @[@"1", @"2", @"3"];


    dispatch_queue_t queue;
    queue = dispatch_queue_create("com.example.MyQueue", NULL);
    
    dispatch_apply([testArray count], queue, ^(size_t i) {
        NSLog(@"%@", [testArray objectAtIndex:i]);
    });
//    for (int i = 0; i < [testArray count]; i++) {
//        NSLog(@"%@", [testArray objectAtIndex:i]);
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonAction:(id)sender {
    [self doSomething];
}

- (IBAction)secondAction:(id)sender {
    NSLog(@"second action!");
}

-(void)doSomething {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            //start progress
            self.activityIndicator.hidden = NO;
            [self.activityIndicator startAnimating];
        });
        
        //emulate logic
        NSLog(@"start calculation");
        sleep(2);
        
        NSLog(@"end calculation");
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            //stop progress
            [self.activityIndicator stopAnimating];
        });
    });
}
@end
