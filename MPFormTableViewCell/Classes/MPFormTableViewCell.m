//
//  MPFormTableViewCell.m
//  Lafay
//
//  Created by Martin Prot on 27/04/2015.
//  Copyright (c) 2015 DEKIBAE. All rights reserved.
//

#import "MPFormTableViewCell.h"

NSString * const kMPFormTextFieldTableViewCell = @"MPFormTextFieldTableViewCell";
NSString * const kMPFormTextViewTableViewCell = @"MPFormTextViewTableViewCell";
NSString * const kMPFormPickerTableViewCell = @"MPFormPickerTableViewCell";
NSString * const kMPFormDateFieldTableViewCell = @"MPFormDateFieldTableViewCell";
NSString * const kMPFormRadioTableViewCell = @"MPFormRadioTableViewCell";
NSString * const kMPFormSwitchTableViewCell = @"MPFormSwitchTableViewCell";

@interface MPFormTableViewCell ()

@end

@implementation MPFormTableViewCell

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
