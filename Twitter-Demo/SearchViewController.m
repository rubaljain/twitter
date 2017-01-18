//
//  SearchViewController.m
//  Twitter-Demo
//
//  Created by Rubal on 17/01/17.
//  Copyright © 2017 Rubal. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Result Show
    TWTRAPIClient *client = [[TWTRAPIClient alloc] init];
    
    //check for Date
    NSDate *currentDate = [NSDate date];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:-30];
    NSDate *thirtyDaysAgo = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:currentDate options:0];
    NSString *earlierDate = [self dateformat:thirtyDaysAgo];
    
    TWTRSearchTimelineDataSource *dataSrc = [[TWTRSearchTimelineDataSource alloc]initWithSearchQuery:[NSString stringWithFormat:@"%@ since:%@",self.searchText,earlierDate] APIClient:client];
    
    
    //check for location and radius of 2KM
    [dataSrc setGeocodeSpecifier:[NSString stringWithFormat:@"%@,1.24mi",[CVCUser sharedInstance].userLong]];
    
    //check for recent twits
    [dataSrc setTopTweetsOnly:NO];

    self.dataSource = dataSrc;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];

}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString* )dateformat:(NSDate*)earlierDate{
    NSDateFormatter *frmtr = [[NSDateFormatter alloc]init];
    [frmtr setDateFormat:@"YYYY-MM-dd"];
    NSString *retrnDate = [frmtr stringFromDate:earlierDate];
    return retrnDate;
}
@end
