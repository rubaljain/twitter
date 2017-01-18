//
//  HomeViewController.m
//  Twitter-Demo
//
//  Created by Rubal on 17/01/17.
//  Copyright © 2017 Rubal. All rights reserved.
//

#import "HomeViewController.h"
#import "SearchViewController.h"

@interface HomeViewController ()
{
    NSArray *resultArray;
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //Set User Details
    self.profileImage.image = [CVCUser sharedInstance].userImage;
    self.userName.text = [CVCUser sharedInstance].userName;
    
    //Textfield setup
    self.searchTxtField.delegate = self;
    
    //Hide Navigation
    [self.navigationController setNavigationBarHidden:YES];
    
}


#pragma mark - Button Actions

- (IBAction)searchBtnAction:(id)sender {
    
    
    //Empty Text Check
    self.searchTxtField.text = [self.searchTxtField.text stringByTrimmingCharactersInSet:
                                [NSCharacterSet whitespaceCharacterSet]];
    
    
    if ([self.searchTxtField.text isEqualToString:@""]) {
        [self.view makeToast:@"Please add text for search." duration:3.0 position:CSToastPositionCenter];
        return;
        
    }
    
    NSString *mystr=[self.searchTxtField.text substringToIndex:1];
    
    //Finding # tag
    if (![mystr isEqualToString:@"#"]) {
        [self.view makeToast:@"This app is functionable only for searching hashtags. Please add hash before your search." duration:3.0 position:CSToastPositionCenter];
        return;
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SearchViewController *searchView = [storyboard instantiateViewControllerWithIdentifier:@"searchView"];
    searchView.searchText = self.searchTxtField.text;
    [self.navigationController pushViewController:searchView animated:YES];
    
}

- (IBAction)postBtnAction:(id)sender {
    
    //Image add or not Check
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"POST TO TWITTER" message:@"Choose Options:" preferredStyle:    UIAlertControllerStyleAlert];
    
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"With Image" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:picker animated:YES completion:nil];
    }]];
    
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Without Image" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        TWTRComposer *composer = [[TWTRComposer alloc] init];
        
        [composer setText:@""];
        
        [composer showFromViewController:self completion:^(TWTRComposerResult result) {
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

            if (result == TWTRComposerResultCancelled) {
                NSLog(@"Tweet composition cancelled");
            }
            else {
                NSLog(@"Sending Tweet!");
            }
        }];

    }]];
    
    // Present action sheet.
    [self presentViewController:actionSheet animated:YES completion:nil];

   }

#pragma mark - Image picker Delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    
    [picker dismissViewControllerAnimated:YES completion:nil];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        TWTRComposer *composer = [[TWTRComposer alloc] init];
        
        [composer setText:@""];
        [composer setImage:chosenImage];
        
        // Called from a UIViewController
        [composer showFromViewController:self completion:^(TWTRComposerResult result) {
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

            if (result == TWTRComposerResultCancelled) {
                NSLog(@"Tweet composition cancelled");
            }
            else {
                NSLog(@"Sending Tweet!");
                [self.view makeToast:@"Sending tweet.." duration:3.0 position:CSToastPositionTop];
            }
        }];
        

    });
   }

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - TextField Delegate


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
