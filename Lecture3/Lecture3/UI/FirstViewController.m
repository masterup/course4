//
//  FirstViewController.m
//  Lecture3
//
//  Created by Igor Tomych on 5/20/13.
//  Copyright (c) 2013 Igor Tomych. All rights reserved.
//

#import "FirstViewController.h"
#import "LoginViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Home";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Login" style:UIBarButtonItemStyleBordered target:self action:@selector(loginAction)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action 
- (IBAction)messagesAction:(id)sender {
    NSLog(@"messagesAction");
    UITableViewController* tableController = [[UITableViewController alloc] init];
    [self.navigationController pushViewController:tableController animated:YES];
}

- (void)loginAction {
    NSLog(@"loginAction");
    LoginViewController* loginController = [[LoginViewController alloc] init];
    
    [self presentViewController:loginController animated:YES completion:^{
        //
    }];
//    [self.navigationController presentModalViewController:mySecondController animated:YES];
}

@end
