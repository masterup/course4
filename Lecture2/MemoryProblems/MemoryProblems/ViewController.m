//
//  ViewController.m
//  MemoryProblems
//
//  Created by Igor Tomych on 5/16/13.
//  Copyright (c) 2013 Igor Tomych. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)create:(id)sender {
    if (!self.date) {
        NSLog(@"Создаем объект");
        self.date = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
    }
}

- (IBAction)clean:(id)sender {
    NSLog(@"Удаляем объект");
    self.date = nil;
}

- (IBAction)message:(id)sender {
    NSLog(@"Посылаем сообщение объекту");
    
    NSLocale* ruLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru"];
    
    NSString *localizedDescription = [self.date descriptionWithLocale:ruLocale];
    
    NSLog(@"Локализированная дата %@", localizedDescription);
}

@end
