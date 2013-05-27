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

//анонимная категория
@interface ViewController ()

@property (strong, nonatomic) NSArray* applications;

@end

@implementation ViewController

@synthesize applications;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString* link = @"http://phobos.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/toppaidapplications/limit=100/json";
    
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:link]];
    
  
    AFJSONRequestOperation *requestOperation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSDictionary* responseJson = JSON;
        
        
        NSLog(@"%@", [[responseJson objectForKey:@"entry"] class]);
        
        self.applications = [[responseJson objectForKey:@"feed"] objectForKey:@"entry"];
        [self.tableView reloadData];
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"request fail!");
    }];
    
    
    [requestOperation start];
    
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
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //пытаемся достать ячейку из очереди
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        //если нет ячейки, мы ее создаем
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    //и только после этого мы выставляем необходимую информацию
//    cell.textLabel.text = [NSString stringWithFormat:@"cell %d", indexPath.row];
    NSDictionary* applicationDictionary = [self.applications objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [[applicationDictionary objectForKey:@"im:name"] objectForKey:@"label"];
//    cell.imageView.image = ;
    
    NSString* imageLink = [[[applicationDictionary objectForKey:@"im:image"] objectAtIndex:0] objectForKey:@"label"];

    [cell.imageView setImageWithURL:[NSURL URLWithString:imageLink] placeholderImage:[UIImage imageNamed:@"Placeholder.png"]];
    
//    NSLog(@"%@", imageLink);
//    
//    NSData* imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:imageLink]];
//    
//    cell.imageView.image = [UIImage imageWithData:imageData];
    
    return cell;
}

@end
