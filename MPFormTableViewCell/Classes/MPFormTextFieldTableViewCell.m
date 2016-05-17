//
//  MPFormTextFieldTableViewCell.m
//  Lafay
//
//  Created by Martin Prot on 27/04/2015.
//  Copyright (c) 2015 DEKIBAE. All rights reserved.
//

#import "MPFormTextFieldTableViewCell.h"

NSInteger const kFormTextViewTableViewCellHeight = 80;

@implementation MPFormTextFieldTableViewCell

- (void)prepareForReuse {
	[super prepareForReuse];
	self.textField.text = nil;
	self.textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
	self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
	self.textField.secureTextEntry = NO;
	self.textField.keyboardType = UIKeyboardTypeDefault;
	self.textField.returnKeyType = UIReturnKeyNext;
}

- (void)awakeFromNib {
	self.textField.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (BOOL)resignFirstResponder {
	[super resignFirstResponder];
	return [self.textField resignFirstResponder];
}

- (BOOL)becomeFirstResponder {
	return [self.textField becomeFirstResponder];
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark TEXTFIELD DELEGATE
#pragma mark -
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
	if([self.delegate respondsToSelector:@selector(formTableViewCellDidFocus:)]) {
		[self.delegate formTableViewCellDidFocus:self];
	}
	return YES;
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
	NSString * finalText = [textField.text stringByReplacingCharactersInRange:range withString:string];
	
	if ([self.delegate respondsToSelector:@selector(formTableViewCellShouldWriteString:atIndexPath:)] &&
		![self.delegate formTableViewCellShouldWriteString:string atIndexPath:self.indexPath]) {
		return NO;
	}
	else {
		[self.delegate formTableViewCell:self didChangeValue:finalText atIndexPath:self.indexPath];
		return YES;
	}
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	if([self.delegate respondsToSelector:@selector(formTableViewCellDidReturn:)]) {
		[self.delegate formTableViewCellDidReturn:self];
	}
	else [self resignFirstResponder];
	return YES;
}

@end
