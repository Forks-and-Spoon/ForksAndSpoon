//
//  FoodItemViewController.m
//  Forks and Spoon
//
//  Created by Akshay Budhkar on 2015-03-01.
//  Copyright (c) 2015 Akshay Budhkar. All rights reserved.
//

#import "FoodItemViewController.h"
#import "FNSRequest.h"
#import "MakeMenuViewController.h"

@interface FoodItemViewController ()

@end

@implementation FoodItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"foodItem"]) {
        AFHTTPRequestOperation *op = [FNSRequest createFoodItemForName:self.textField.text withDescription:self.description withRestriction:@"None" withSpiceLevel:[NSNumber numberWithInteger: self.spicySegmentedControl.selectedSegmentIndex]  forPrice:@10 withSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            MakeMenuViewController *vc = (MakeMenuViewController *)[segue destinationViewController];
            [vc.fetchedFoodItems addObject:responseObject];
        } withFailure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"The error is %@", error);
        }];
        
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        [queue addOperation:op];
    }
}
@end
