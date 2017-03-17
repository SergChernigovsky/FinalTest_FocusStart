//
//  FSBaseViewController.h
//  FinalTestChernigovsky
//
//  Created by Student on 11.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FSScreenUIFactory;
@class FSBasePresenter;

@interface FSBaseViewController : UIViewController

@property (nonatomic, strong) FSBasePresenter *screenPresenter;

- (instancetype)initWithScreenUIFactory:(FSScreenUIFactory *)screenFactory NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (void)completeError:(NSError *)error;

@end
