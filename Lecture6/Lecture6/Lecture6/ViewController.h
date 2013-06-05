//
//  ViewController.h
//  Lecture6
//
//  Created by Igor Tomych on 6/3/13.
//  Copyright (c) 2013 Igor Tomych. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
- (IBAction)buttonAction:(id)sender;
- (IBAction)secondAction:(id)sender;

@end
