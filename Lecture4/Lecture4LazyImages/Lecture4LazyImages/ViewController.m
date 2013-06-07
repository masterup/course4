//
//  ViewController.m
//  Lecture4LazyImages
//
//  Created by Igor Tomych on 5/27/13.
//  Copyright (c) 2013 Igor Tomych. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "MBProgressHUD.h"
#import "CalendarViewController.h"
#import "LazyAPI.h"
#import "StoreApplication.h"

#import "AppDelegate.h"

//анонимная категория
@interface ViewController ()

@property (strong, nonatomic) NSArray* applications;

@end

@implementation ViewController

@synthesize applications;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AppDelegate* appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    self.context = [appDelegate managedObjectContext];
    
    [LazyAPI sharedClient].context = self.context;
    [[LazyAPI sharedClient] getTopApplicationWithSuccess:^(NSArray* topApplication){
        self.applications = topApplication;
        [self.tableView reloadData];
        
    } andFail:^{
        NSLog(@"fail!");
    }];
    
    self.title = @"Top Paid Applications";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.applications count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //пытаемся достать ячейку из очереди
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        //если нет ячейки, мы ее создаем
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    //и только после этого мы выставляем необходимую информацию
    StoreApplication* app = [self.applications objectAtIndex:indexPath.row];
    
    cell.textLabel.text = app.name;

    if (app.image != nil) {
        cell.imageView.image = [app.image valueForKey:@"image"];
    }
    else {
        [cell.imageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:app.imageURL]] placeholderImage:[UIImage imageNamed:@"Placeholder.png"] success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
            //
            
            NSManagedObject *managedImage = [NSEntityDescription insertNewObjectForEntityForName:@"Image" inManagedObjectContext:app.managedObjectContext];
            
            app.image = managedImage;
            
            [managedImage setValue:image forKey:@"image"];
            
            [app.managedObjectContext save:nil];
            
            cell.imageView.image = image;
        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
            //
        }];
    }
    
    return cell;
}

@end
