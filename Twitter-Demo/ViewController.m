//
//  ViewController.m
//  Twitter-Demo
//
//  Created by Rubal on 17/01/17.
//  Copyright © 2017 Rubal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CLLocationManager *locationManager;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //twitter Button Setup
    [self twitterLoginCallBack];
    
    //location manager
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
        NSUInteger code = [CLLocationManager authorizationStatus];
    
        if (code == kCLAuthorizationStatusNotDetermined && ([locationManager respondsToSelector:@selector(requestAlwaysAuthorization)] || [locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])) {
            // choose one request according to your business.
            if([[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSLocationAlwaysUsageDescription"]){
                [locationManager requestAlwaysAuthorization];
            } else if([[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSLocationWhenInUseUsageDescription"]) {
                [locationManager  requestWhenInUseAuthorization];
            } else {
                NSLog(@"Info.plist does not contain NSLocationAlwaysUsageDescription or NSLocationWhenInUseUsageDescription");
            }
        }
    [locationManager startUpdatingLocation];

}


-(void)twitterLoginCallBack{
    
    //Twitter Login
    TWTRLogInButton *logInButton = [TWTRLogInButton buttonWithLogInCompletion:^(TWTRSession *session, NSError *error) {
        if (session) {
            
            NSString *userID = [Twitter sharedInstance].sessionStore.session.userID;
            TWTRAPIClient *client = [[TWTRAPIClient alloc] initWithUserID:userID];
            [client loadUserWithID:userID completion:^(TWTRUser *user, NSError *error) {
                
                //Twitter Image Set
                NSURL *url = [NSURL URLWithString:user.profileImageLargeURL];
                NSData *data = [NSData dataWithContentsOfURL:url];
                UIImage *image = [UIImage imageWithData:data];
                [CVCUser sharedInstance].userImage = image;
                [CVCUser sharedInstance].authSecret = session.authTokenSecret;
                [CVCUser sharedInstance].authToken = session.authToken;
                [[CVCUser sharedInstance]saveAllElements];

                //Home move
                [self performSegueWithIdentifier:@"showHome" sender:self];
            }];
            
            [CVCUser sharedInstance].userId = [session userID];
            [CVCUser sharedInstance].userName = [session userName];
            
        } else {
            NSLog(@"Login error: %@", [error localizedDescription]);
        }
    }];
    logInButton.center = self.view.center;
    [self.view addSubview:logInButton];
    
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    [self.view makeToast:@"Error: Failed to get your location." duration:4.0 position:CSToastPositionCenter];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        [CVCUser sharedInstance].userLong = [NSString stringWithFormat:@"%.2f,%.2f",newLocation.coordinate.latitude,newLocation.coordinate.longitude];
        [[CVCUser sharedInstance]saveAllElements];
        [locationManager stopUpdatingLocation];
    }
}
@end
