//
//  AppDelegate.h
//  Twitter-Demo
//
//  Created by Rubal on 17/01/17.
//  Copyright © 2017 Rubal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@property (strong,nonatomic)UIActivityIndicatorView *indicator;

@end

