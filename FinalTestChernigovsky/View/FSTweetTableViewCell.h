//
//  FSTweetTableViewCell.h
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 23.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FSTweetTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *viewUserIcon;

@property (weak, nonatomic) IBOutlet UILabel *labelText;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelScreenName;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;
@property (weak, nonatomic) IBOutlet UILabel *labelRetweet;
@property (weak, nonatomic) IBOutlet UILabel *labelLike;
@property (weak, nonatomic) IBOutlet UILabel *labelRetweetUser;
@property (weak, nonatomic) IBOutlet UILabel *labelUrl;

@property (weak, nonatomic) IBOutlet UIImageView *imageUserIcon;
@property (weak, nonatomic) IBOutlet UIImageView *imageMedia;
@property (weak, nonatomic) IBOutlet UIImageView *imageRetweet;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
