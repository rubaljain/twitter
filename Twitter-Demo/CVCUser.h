//
//  CVCUser.h
//  Twitter-Demo
//
//  Created by Rubal on 17/01/17.
//  Copyright © 2017 Rubal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CVCUser : NSObject
@property(nonatomic, strong) NSString *userName ;
@property(nonatomic, strong) NSString *userEmail ;
@property(nonatomic, strong) NSString *authToken ;
@property(nonatomic, strong) NSString *userId;
@property(nonatomic, strong) NSString *authSecret;
@property (strong, nonatomic) NSData* deviceTokenData;
@property(nonatomic, strong) NSString *devicePassword;
@property(nonatomic, strong) NSString *userLong;
@property(nonatomic, strong) NSString *userAddress;
@property(nonatomic, strong) NSString *candidateRole;
@property(nonatomic, strong) NSString *userDOB;



@property(nonatomic, strong) NSString *userPassword;
@property(nonatomic, strong) NSString *userStatus;
@property(nonatomic, strong) NSString *resetStatus;

@property(nonatomic, strong) NSString *userWebsite;
@property(nonatomic, strong) NSString *userFullname;
@property(nonatomic, strong) NSString *userFirstname;
@property(nonatomic, strong) NSString *userLastname;
@property(nonatomic, strong) NSString *loggedIn;
@property(nonatomic, strong) NSString *profilepictureURL;
@property(nonatomic, assign) BOOL isPrivateAccount;
@property(nonatomic, strong) NSString *loginType;
@property(nonatomic, strong) UIImage *userImage;

//@property(nonatomic, strong) id userdelegate<TRUserLoginDelegate>;
@property(nonatomic, strong) NSDictionary *facebookUserDetails;
@property(nonatomic, strong) NSDictionary *twitterUserDetails;
@property(nonatomic, strong) NSDictionary *googlePlusUserDetails;
@property(nonatomic, strong) NSString *sessionKey;
@property(nonatomic, strong) NSString *apiKey;

+ (CVCUser *)sharedInstance;
-(void)listAllElements;
-(void)saveAllElements;
-(void)logout;

@end
