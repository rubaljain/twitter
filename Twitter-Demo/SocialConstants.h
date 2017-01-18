//
//  SocialConstants.h
//  Twitter-Demo
//
//  Created by Rubal on 17/01/17.
//  Copyright © 2017 Rubal. All rights reserved.
//

#ifndef Nortello_SocialConstants_h
#define Nortello_SocialConstants_h

//Social account keys
#define K_FACEBOOK_KEY   @"1620845218173623"
#define  k_Facebook_id  @"UserFaceBookID"
#define  k_googlePlusClientId   @"280779596620-nnvoa7eou7n1h5cqg1smenbg6gftnaji.apps.googleusercontent.com"
#define  twitterID  @""
#define  k_parse_applicationID  @"2CvydJariOMllKvYlpMEdTl1tD23QvvF2IGos6Gx"
#define  k_parse_clientKey  @"qmOm9JxhHsMfAkkj49IytVoU33ZN7GrVFocHwfNv"
#define FACEBOOK_USER_DETAILS   @"facebookuserdetails"
#define TWITTER_USER_DETAILS   @"twitteruserdetails"
#define GOOGLE_USER_DETAILS   @"googleplususerdetails"
#define k_FACEBOOK_PAGEID   @"3RootsStudios"

#define BLUE_COLOR_LIGHT [UIColor colorWithRed:23.0/255.0 green:78.0/255.0 blue:145.0/255.0 alpha:1.0]
#define BLUE_COLOR_DARK [UIColor colorWithRed:5.0/255.0 green:81.0/255.0 blue:177.0/255.0 alpha:1.0]
#define GREEN_COLOR_DARK [UIColor colorWithRed:121.0/255.0 green:200.0/255.0 blue:67.0/255.0 alpha:1.0]
#define GRAY_COLOR_LIGHT [UIColor colorWithRed:102.0/255.0 green:102.0/255.0 blue:102.0/255.0 alpha:1.0]
#define K_LAUNCH_HOME @"launchHomeController"
#define K_LAUNCH_SEARCH @"launchSearchController"
#define K_LAUNCH_CAMERA @"launchCameraController"
#define K_LAUNCH_NOTTIFICATIONS @"launchNotificationsController"
#define K_LAUNCH_PROFILE  @"launchProfileController"
#define K_APP_LOGOUT  @"appLogout"
#define K_RELOAD_FEED @"reloadFeed"

#define k_TimeStamp [NSString stringWithFormat:@"%f",[[NSDate serverDate] timeIntervalSince1970]]

typedef enum verbosityLog{
    kVerbosityLogError          = (1 << 0), /* 0b0000000000000001 */
    kVerbosityLogWarning        = (1 << 1), /* 0b0000000000000010 */
    kVerbosityLogBasic          = (1 << 2), /* 0b0000000000000100 */
    kVerbosityLogDetailed       = (1 << 3), /* 0b0000000000001000 */
    kVerbosityLogAllLogs        = kVerbosityLogError | kVerbosityLogWarning | kVerbosityLogBasic | kVerbosityLogDetailed
}kVerbosityLog;


#define ShowAlertARC(title,msg,cancelButtonName) UIAlertView *alert =[[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:cancelButtonName otherButtonTitles:nil];\
[alert show];

//alert
#define ShowAlert(title,msg,cancelButtonName) UIAlertView *alert =[[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:cancelButtonName otherButtonTitles:nil];\
[alert show];\
[alert release]

//release
#define Release(var) if(var){[var release]; var=nil;}

//Swift - Macros
#define k_APP_NAME  @"Nortello"
#define kAppVersionNumber                           @"1.0"
#define k_USER_PROFILE_PIC_PATH  [NSString stringWithFormat:@"%@/Documents/profilePic.png", NSHomeDirectory()]

#define USER_ID  @"userid"
#define AUTH_SECRET  @"authSecret"
#define RESET_STATUS  @"reset_Status"


#define USER_NAME  @"username"
#define USER_DOB  @"userDOB"

#define USER_PASSWORD @"password"
#define DEVICE_PASSWORD @"device_password"
#define USER_LONG @"long"
#define USER_ADDRESS @"address"
#define USER_ROLE  @"candidateRole"
#define USER_STATUS  @"candidateStatus"



#define USER_FIRSTNAME @"firstname"
#define USER_LASTNAME @"lastname"
#define USER_LOGGEDIN @"loggedIn"
#define Auth_Token  @"authToken"
#define USER_DEVICETOKEN_DATA @"devicetokenData"
#define USER_EMAIL  @"email"
#define USER_PROFILE_PIC_URL  @"profilepicUrl"
#define API_SESSION_KEY  @"sessionkey"
#define API_KEY  @"api_key"
#define IS_PRIVATE_ACCOUNT  @"isPrivateAccount"
#define USER_PROFILE_PIC_URL  @"profilepicUrl"
#define USER_LOG_IN_TYPE  @"signup_type"

#define k_MP3_SOUND_FILE_TYPE  @"mp3"
#define APPFONT_LIGHT  @"ChalkboardSE-Light"
#define APPFONT_BOLD  @"ChalkboardSE-Bold"
#define APPFONT_REGULAR  @"ChalkboardSE-Regular"

typedef enum{
    kTabbarButtonConstantsNone,
    kTabbarButtonConstantsNewsFeed,
    kTabbarButtonConstantsSearch,
    kTabbarButtonConstantsCamera,
    kTabbarButtonConstantsNotiifcations,
    kTabbarButtonConstantsProfile,
    kTabbarButtonConstantsCount
}kTabbarButtonConstants;

#define k_FOLLOW_STATUS_STRING @"Followed"
#define k_UNFOLLOW_STATUS_STRING @"Unfollow"
#define k_PENDING_STATUS_STRING @"Follow request sent."

//notifications
//#define k_NotificationsTypeRead @"readNotifications"
//#define k_NotificationsTypePost @"postNotifications"
//#define k_NotificationsTypeComment @"commentNotifications"
//#define k_NotificationsTypeLiked @"likedNotifications"
//#define k_NotificationsTypeDisliked @"dislikedNotifications"
//#define k_NotificationsTypeFollow @"followNotifications"
#define k_NotificationsTypeFollowed @"followedNotification"
#define k_NotificationsTypeFollowRequest @"followRequestNotification"
#define k_NotificationsTypeFollowApproved @"followApprovedNotification"
#define k_NotificationsTypePostReady @"postReadyNotification"
#define k_NotificationsTypeCommentReady @"commentsReadyNotification"
#define k_NotificationsTypeResultReady @"resultsReadyNotification"

#define k_NotificationsTypePostDeleted @"PostDeletedNotification"

#define K_BOX_SELECTED_COLOR [UIColor colorWithRed:0.0 green:143.0/255.0 blue:88.0/255.0 alpha:1.0]

#endif
