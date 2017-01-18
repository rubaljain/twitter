//
//  HomeViewController.h
//  Twitter-Demo
//
//  Created by Rubal on 17/01/17.
//  Copyright © 2017 Rubal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UITextField *searchTxtField;
- (IBAction)searchBtnAction:(id)sender;

@end
