//
//  FSTweetTableViewCell.m
//  FinalTestChernigovsky
//
//  Created by Sergey Chernigovsky on 23.03.17.
//  Copyright © 2017 CFT:FocusStart. All rights reserved.
//

#import "FSTweetTableViewCell.h"

@implementation FSTweetTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.viewUserIcon.layer.cornerRadius = 4.f;
    self.imageUserIcon.layer.cornerRadius = 4.f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
