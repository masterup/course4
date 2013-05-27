//
//  ViewController.h
//  MemoryProblems
//
//  Created by Igor Tomych on 5/16/13.
//  Copyright (c) 2013 Igor Tomych. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
//    NSDate* _date;
}

@property (strong, nonatomic) NSDate* date;


- (IBAction)create:(id)sender;
- (IBAction)clean:(id)sender;
- (IBAction)message:(id)sender;

@end
