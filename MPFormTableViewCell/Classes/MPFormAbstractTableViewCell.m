//
//  MPFormAbstractTableViewCell.m
//  Lafay
//
//  Created by Martin Prot on 27/04/2015.
//  Copyright (c) 2015 DEKIBAE. All rights reserved.
//

#import "MPFormAbstractTableViewCell.h"

@interface MPFormAbstractTableViewCell ()

@end

@implementation MPFormAbstractTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (BOOL)resignFirstResponder {
	return [super resignFirstResponder];
}

- (BOOL)becomeFirstResponder {
	return NO;
}

@end
