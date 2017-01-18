//
//  CVCUser.m
//  Twitter-Demo
//
//  Created by Rubal on 17/01/17.
//  Copyright © 2017 Rubal. All rights reserved.
//

#import "CVCUser.h"
#import "SocialConstants.h"
#import <UIKit/UIKit.h>

@implementation CVCUser

@synthesize userName ;
@synthesize authSecret;
@synthesize userEmail;
@synthesize candidateRole;
@synthesize authToken ;
@synthesize userId;
@synthesize userDOB;

@synthesize userPassword;
@synthesize userStatus;
@synthesize resetStatus;

@synthesize userWebsite;
@synthesize userFullname;
@synthesize userFirstname;
@synthesize userLastname;
@synthesize profilepictureURL;
@synthesize userImage;
@synthesize facebookUserDetails;
@synthesize twitterUserDetails;
@synthesize googlePlusUserDetails;
@synthesize sessionKey;
@synthesize loggedIn;
@synthesize deviceTokenData;
@synthesize userLong;
@synthesize devicePassword;
@synthesize userAddress;

static CVCUser *sharedObject = NULL;

+ (CVCUser *)sharedInstance{
    
    if(sharedObject == NULL){
        sharedObject = [[CVCUser alloc] init];
        
        //parse
        /* uncomment to use parse
         Parse.setApplicationId(k_parse_applicationID, clientKey: k_parse_clientKey)
         */
        
        //load userImage with existing file if any or empty image
        if ([[NSUserDefaults standardUserDefaults]objectForKey:k_USER_PROFILE_PIC_PATH]) {
            sharedObject.profilepictureURL = [[NSUserDefaults standardUserDefaults]objectForKey:k_USER_PROFILE_PIC_PATH];
        }
        
        if ([[NSUserDefaults standardUserDefaults]objectForKey:RESET_STATUS]) {
            sharedObject.resetStatus = [[NSUserDefaults standardUserDefaults]objectForKey:RESET_STATUS];
        }
        //load userImage with existing file if any or empty image
        if ([[NSFileManager defaultManager]fileExistsAtPath:USER_PROFILE_PIC_URL]) {
            sharedObject.userImage = [UIImage imageWithContentsOfFile:k_USER_PROFILE_PIC_PATH];
        }
        
        //load userImage with existing file if any or empty image
        
        //load user Status if any
        sharedObject.userStatus = [[NSUserDefaults standardUserDefaults]objectForKey:USER_STATUS];
        if (sharedObject.userStatus){
            NSLog(@"%s a user was found with the userStatus:%@",__FUNCTION__,sharedObject.userStatus);
        }
        else{
            NSLog(@"%s No userId found",__FUNCTION__);
        }
        
        
        //load user Password if any
        sharedObject.userPassword = [[NSUserDefaults standardUserDefaults]objectForKey:USER_PASSWORD];
        if (sharedObject.userPassword){
            NSLog(@"%s a user was found with the userPassword:%@",__FUNCTION__,sharedObject.userPassword);
        }
        else{
            NSLog(@"%s No userId found",__FUNCTION__);
        }
        
        //load userid if any
        sharedObject.authSecret = [[NSUserDefaults standardUserDefaults]objectForKey:AUTH_SECRET];
        if (sharedObject.authSecret){
            NSLog(@"%s a user was found with the userId:%@",__FUNCTION__,sharedObject.authSecret);
        }
        else{
            NSLog(@"%s No userId found",__FUNCTION__);
        }


        
        //load username
        sharedObject.userName = [[NSUserDefaults standardUserDefaults]objectForKey:USER_NAME];
        if (sharedObject.userName){
            NSLog(@"%s a user was found with the userId:%@",__FUNCTION__,sharedObject.userName);
        }
        else{
            NSLog(@"%s No userId found",__FUNCTION__);
        }
        
        //load username
        sharedObject.userName = [[NSUserDefaults standardUserDefaults]objectForKey:USER_NAME];
        if (sharedObject.userName){
            NSLog(@"%s a user was found with the userId:%@",__FUNCTION__,sharedObject.userName);
        }
        else{
            NSLog(@"%s No userId found",__FUNCTION__);
        }
        
        //load dob
        sharedObject.userDOB = [[NSUserDefaults standardUserDefaults]objectForKey:USER_DOB];
        if (sharedObject.userDOB){
            NSLog(@"%s a user was found with the userId:%@",__FUNCTION__,sharedObject.userDOB);
        }
        else{
            NSLog(@"%s No userId found",__FUNCTION__);
        }
        

        
        //load candidateRole
        sharedObject.userName = [[NSUserDefaults standardUserDefaults]objectForKey:USER_ROLE];
        if (sharedObject.candidateRole){
            NSLog(@"%s a user was found with the userId:%@",__FUNCTION__,sharedObject.candidateRole);
        }
        else{
            NSLog(@"%s No userId found",__FUNCTION__);
        }

        //load userid if any
        sharedObject.userId = [[NSUserDefaults standardUserDefaults]objectForKey:USER_ID];
        if (sharedObject.userId){
            NSLog(@"%s a user was found with the userId:%@",__FUNCTION__,sharedObject.userId);
        }
        else{
            NSLog(@"%s No userId found",__FUNCTION__);
        }
        
        
        //load userlat if any
        sharedObject.devicePassword = [[NSUserDefaults standardUserDefaults]objectForKey:DEVICE_PASSWORD];
        if (sharedObject.devicePassword){
            NSLog(@"%s a user was found with the userId:%@",__FUNCTION__,sharedObject.devicePassword);
        }
        else{
            NSLog(@"%s No userId found",__FUNCTION__);
        }
        
        //load user_long if any
        sharedObject.userLong = [[NSUserDefaults standardUserDefaults]objectForKey:USER_LONG];
        if (sharedObject.userLong){
            NSLog(@"%s a user was found with the description:%@",__FUNCTION__,sharedObject.userLong);
        }
        else{
            NSLog(@"%s No username found",__FUNCTION__);
        }
        
        //load user_aadress if any
        sharedObject.userAddress = [[NSUserDefaults standardUserDefaults]objectForKey:USER_ADDRESS];
        if (sharedObject.userAddress){
            NSLog(@"%s a user was found with the description:%@",__FUNCTION__,sharedObject.userAddress);
        }
        else{
            NSLog(@"%s No username found",__FUNCTION__);
        }
        
        //load first name
        sharedObject.userFirstname = [[NSUserDefaults standardUserDefaults]objectForKey:USER_FIRSTNAME];
        if (sharedObject.userFirstname){
            NSLog(@"%s a user was found with the description:%@",__FUNCTION__,sharedObject.userFirstname);
        }
        else{
            NSLog(@"%s No username found",__FUNCTION__);
        }
        
        //load last name
        sharedObject.userLastname = [[NSUserDefaults standardUserDefaults]objectForKey:USER_LASTNAME];
        if (sharedObject.userLastname){
            NSLog(@"%s a user was found with the description:%@",__FUNCTION__,sharedObject.userLastname);
        }
        else{
            NSLog(@"%s No username found",__FUNCTION__);
        }
        
        //load signed ARRAY
        sharedObject.loggedIn = [[NSUserDefaults standardUserDefaults]objectForKey:USER_LOGGEDIN];
        if (sharedObject.loggedIn){
            NSLog(@"%s a user was found with the description:%@",__FUNCTION__,sharedObject.loggedIn);
        }
        else{
            NSLog(@"%s No signedArray found",__FUNCTION__);
        }
        
        
        //load device token data
        sharedObject.deviceTokenData = [[NSUserDefaults standardUserDefaults]objectForKey:USER_DEVICETOKEN_DATA];
        if (sharedObject.deviceTokenData){
            NSLog(@"%s a device token data:%@",__FUNCTION__,sharedObject.deviceTokenData);
        }
        else{
            NSLog(@"%s No username found",__FUNCTION__);
        }
        
        
        //load userdescription if any
        sharedObject.authToken = [[NSUserDefaults standardUserDefaults]objectForKey:Auth_Token];
        if (sharedObject.authToken){
            NSLog(@"%s a user was found with the userDescription:%@",__FUNCTION__,sharedObject.authToken);
        }
        else{
            NSLog(@"%s No userDescription found",__FUNCTION__);
        }
        
        //load useremail if any
        sharedObject.userEmail = [[NSUserDefaults standardUserDefaults]objectForKey:USER_EMAIL];
        if (sharedObject.userEmail){
            NSLog(@"%s a user was found with the userEmail:%@",__FUNCTION__,sharedObject.userEmail);
        }
        else{
            NSLog(@"%s No userEmail found",__FUNCTION__);
        }
        
        sharedObject.profilepictureURL = [[NSUserDefaults standardUserDefaults]objectForKey:USER_PROFILE_PIC_URL];
        if (sharedObject.profilepictureURL){
            NSLog(@"%s a user was found with the profile pic url:%@",__FUNCTION__,sharedObject.profilepictureURL);
        }
        else{
            NSLog(@"%s No profile pic url found",__FUNCTION__);
        }
        
        //load app session key if any
        sharedObject.sessionKey = [[NSUserDefaults standardUserDefaults]objectForKey:API_SESSION_KEY];
        if (sharedObject.sessionKey){
            NSLog(@"%s a user was found with the sessionKey:%@",__FUNCTION__,sharedObject.sessionKey);
        }
        else{
            NSLog(@"%s No sessionKey found",__FUNCTION__);
        }
        
        //load app session key if any
        sharedObject.isPrivateAccount = [[[NSUserDefaults standardUserDefaults]objectForKey:IS_PRIVATE_ACCOUNT] boolValue];
        if (sharedObject.sessionKey){
            NSLog(@"%s a user was found with the Account type :%d",__FUNCTION__,sharedObject.isPrivateAccount);
        }
        else{
            sharedObject.isPrivateAccount = true;
            NSLog(@"%s No sessionKey found",__FUNCTION__);
        }
        
        //load app session key if any
        sharedObject.apiKey = [[NSUserDefaults standardUserDefaults]objectForKey:API_KEY];
        if (sharedObject.apiKey){
            NSLog(@"%s a user was found with the apiKey:%@",__FUNCTION__,sharedObject.apiKey);
        }
        else{
            NSLog(@"%s No sessionKey found",__FUNCTION__);
        }
        
        
        [sharedObject listAllElements];
        
    }
    return sharedObject;
}
-(id)init{
    if (self=[super init]) {
        userName = nil;
        candidateRole = nil;
        userDOB = nil;
        userEmail = nil;
        authToken = nil;
        userId= nil;
        userPassword= nil;
        userStatus= nil;
        userWebsite= nil;
        userFullname= nil;
        userFirstname= nil;
        userLastname= nil;
        userImage= nil;
        facebookUserDetails= nil;
        twitterUserDetails= nil;
        googlePlusUserDetails= nil;
        sessionKey = nil;
        _loginType = nil;
        loggedIn = nil;
        devicePassword = nil;
        userLong = nil;
        userAddress = nil;
        authSecret = nil;
        resetStatus = nil;
        
        
    }
    return self;
}

//methods
-(void) listAllElements{
    NSLog(@"userName= %@",self.userName);
    NSLog(@"CandRole= %@",self.candidateRole);
    NSLog(@"userDOB= %@",self.userDOB);
    NSLog(@"userDOB= %@",self.resetStatus);


    NSLog(@"userDescription= %@",self.authToken);
    NSLog(@"userImage= %@",self.userImage);
    NSLog(@"userEmail= %@",self.userEmail);
    NSLog(@"userFirstname= %@",self.userFirstname);
    NSLog(@"userLastname= %@",self.userLastname);
    NSLog(@"userPassword= %@",self.devicePassword);
    NSLog(@"userPhone= %@",self.userPassword);
    NSLog(@"userWebsite= %@",self.userWebsite);
    NSLog(@"userId= %@",self.userId);
    NSLog(@"userStatus= %@",self.userStatus);
    NSLog(@"sessionKey= %@",self.sessionKey);
    NSLog(@"loginType= %@",self.loginType);
    NSLog(@"Loggedin= %@",self.loggedIn);
    
}

-(void) saveAllElements{
    
    [[NSUserDefaults standardUserDefaults]setValue:[NSString stringWithFormat:@"%d",self.isPrivateAccount]  forKey: IS_PRIVATE_ACCOUNT];
    
    if(self.loggedIn != nil){
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:USER_LOGGEDIN];
    }
    
    if(self.resetStatus != nil){
        [[NSUserDefaults standardUserDefaults]setValue: self.resetStatus forKey:RESET_STATUS];

    }

    
    if(self.userDOB != nil){
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:USER_DOB];
    }
    
    if(self.devicePassword != nil){
        [[NSUserDefaults standardUserDefaults]setValue: self.devicePassword forKey:DEVICE_PASSWORD];
    }
    
    if(self.userLong != nil){
        [[NSUserDefaults standardUserDefaults]setValue: self.userLong forKey:USER_LONG];
    }
    
    if(self.userAddress != nil){
        [[NSUserDefaults standardUserDefaults]setValue: self.userAddress forKey:USER_ADDRESS];
    }
    
    if(self.userId != nil){
        [[NSUserDefaults standardUserDefaults]setValue: self.userId forKey: USER_ID];
    }
    
    if(self.userName != nil){
        [[NSUserDefaults standardUserDefaults]setValue: self.userName forKey: USER_NAME];
    }
    
    if(self.candidateRole != nil){
        [[NSUserDefaults standardUserDefaults]setValue: self.candidateRole forKey: USER_ROLE];
    }

    if(self.userEmail != nil){
        [[NSUserDefaults standardUserDefaults]setValue: self.userEmail forKey: USER_EMAIL];
    }
    
    if(self.userStatus != nil){
        [[NSUserDefaults standardUserDefaults]setValue: self.userStatus forKey: USER_STATUS];
    }
    
    if(self.userPassword != nil){
        [[NSUserDefaults standardUserDefaults]setValue: self.userPassword forKey: USER_PASSWORD];
    }

    
    if(self.profilepictureURL != nil){
        [[NSUserDefaults standardUserDefaults]setValue: self.profilepictureURL forKey: USER_PROFILE_PIC_URL];
    }
    
    if(self.authSecret != nil){
        [[NSUserDefaults standardUserDefaults]setValue: self.authSecret forKey: AUTH_SECRET];
    }
    
    if(self.authToken != nil &&
       ![self.authToken isKindOfClass:[NSNull class]]){
        [[NSUserDefaults standardUserDefaults]setValue: self.authToken forKey: Auth_Token];
    }
    
    if(self.userImage != nil){
        NSData *imageData = UIImagePNGRepresentation(self.userImage);
        if ([imageData writeToFile:k_USER_PROFILE_PIC_PATH  atomically: true] == true ) {
            NSLog(@"%s User image saved to file",__FUNCTION__);
        }
        else{
            NSLog(@"%s Couldnot save user image to file",__FUNCTION__);
        }
    }
    
    if(self.deviceTokenData != nil &&
       ![self.deviceTokenData isKindOfClass:[NSNull class]]){
        [[NSUserDefaults standardUserDefaults]setValue: self.deviceTokenData forKey: USER_DEVICETOKEN_DATA];
    }
    
    
    if(self.facebookUserDetails != nil){
        [[NSUserDefaults standardUserDefaults ] setValue:self.facebookUserDetails forKey:FACEBOOK_USER_DETAILS];
    }
    
    if(self.twitterUserDetails != nil){
        // NSUserDefaults.standardUserDefaults().setValue(self.twitterUserDetails, forKey: TWITTER_USER_DETAILS)
    }
    if(self.googlePlusUserDetails != nil){
        //TODO: write a custome method as googlePlusUserDetails has custom objects
        // NSUserDefaults.standardUserDefaults().setValue(self.googlePlusUserDetails, forKey: GOOGLE_USER_DETAILS)
    }
    if(self.sessionKey != nil){
        [[NSUserDefaults standardUserDefaults ] setValue:self.sessionKey forKey:API_SESSION_KEY];
    }
    if(self.apiKey != nil){
        [[NSUserDefaults standardUserDefaults ] setValue:self.apiKey forKey:API_KEY];
    }
    if(self.profilepictureURL != nil){
        [[NSUserDefaults standardUserDefaults]setValue: self.profilepictureURL forKey: USER_PROFILE_PIC_URL];
    }
    if(self.loginType != nil){
        [[NSUserDefaults standardUserDefaults]setValue: self.loginType forKey: USER_LOG_IN_TYPE];
    }
    
    
}

-(void)logout{
    userEmail = nil;
    userName = nil;
    authToken = nil;
    userId= nil;
    userPassword= nil;
    userStatus = nil;
    userWebsite= nil;
    userFullname= nil;
    userFirstname= nil;
    userLastname= nil;
    userImage= nil;
    facebookUserDetails= nil;
    twitterUserDetails= nil;
    googlePlusUserDetails= nil;
    loggedIn = nil;
    devicePassword = nil;
    userLong = nil;
    userAddress = nil;
    authSecret = nil;
    resetStatus = nil;

    
    NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
    NSDictionary * dict = [defs dictionaryRepresentation];
    for (id key in dict) {
        [defs removeObjectForKey:key];
    }
    [defs synchronize];
    
}


@end
