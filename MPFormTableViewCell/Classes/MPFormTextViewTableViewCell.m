//
//  MPFormTextViewTableViewCell.m
//  Lafay
//
//  Created by Martin Prot on 13/07/2015.
//  Copyright (c) 2015 DEKIBAE. All rights reserved.
//

#import "MPFormTextViewTableViewCell.h"

@interface MPFormTextViewTableViewCell ()

@property (nonatomic, strong) UIBarButtonItem *accessoryButton;

@property (nonatomic, strong) UIColor *textViewColor;

@property (nonatomic, weak) IBOutlet UILabel *maxCharacterCountLabel;

@end

@implementation MPFormTextViewTableViewCell

- (void)prepareForReuse {
	[super prepareForReuse];
	self.textView.text = nil;
	self.textView.autocapitalizationType = UITextAutocapitalizationTypeNone;
	self.textView.autocorrectionType = UITextAutocorrectionTypeNo;
	self.textView.secureTextEntry = NO;
	self.textView.keyboardType = UIKeyboardTypeDefault;
	self.textView.returnKeyType = UIReturnKeyNext;
}

- (void)awakeFromNib {
	self.textView.delegate = self;
	self.maximumCharacterCount = 0;
	self.textViewColor = self.textView.textColor;
	
	UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 0, 44)];
	toolbar.translucent = YES;
	toolbar.clipsToBounds = YES;
	
	UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:NULL];
	_accessoryButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone	target:self	action:@selector(onOk:)];
	[toolbar setItems:@[space, _accessoryButton]];
	[self.textView setInputAccessoryView:toolbar];
}

- (BOOL)resignFirstResponder {
	[super resignFirstResponder];
	return [self.textView resignFirstResponder];
}

- (BOOL)becomeFirstResponder {
	return [self.textView becomeFirstResponder];
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark SETTERS
#pragma mark -
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)setPlaceholder:(NSString *)placeholder {
	// Si on n'a pas encore de placeholder, OU si on a l'ancien.
	if (self.textView.text.length == 0 || [self.textView.text isEqualToString:self.placeholder]) {
		self.textView.text = placeholder;
	}
	_placeholder = placeholder;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
	_placeholderColor = placeholderColor;
	
	if([self.textView.text isEqualToString:_placeholder]) {
		self.textView.textColor = placeholderColor;
	}
	else {
		self.textView.textColor = self.textViewColor;
	}
}

- (void)setMaximumCharacterCount:(NSUInteger)maximumCharacterCount {
	_maximumCharacterCount = maximumCharacterCount;
	
	self.maxCharacterCountLabel.hidden = (maximumCharacterCount==0);
}

- (void)setText:(NSString *)text {
	self.textView.text = text;
	self.maxCharacterCountLabel.text = [NSString stringWithFormat:@"%zd/%zd", text.length, self.maximumCharacterCount];
}

- (NSString*)text {
	return self.textView.text;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark TEXTFIELD DELEGATE
#pragma mark -
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
	if([self.delegate respondsToSelector:@selector(formTableViewCellDidFocus:)]) {
		[self.delegate formTableViewCellDidFocus:self];
	}
	return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
	if([textView.text isEqualToString:_placeholder]) {
		textView.text = @"";
		textView.textColor = self.textViewColor;
	}
}

- (void)textViewDidEndEditing:(UITextView *)textView {
	if(textView.text.length == 0) {
		textView.text = _placeholder;
		textView.textColor = self.placeholderColor;
	}
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
	NSString * finalText = [textView.text stringByReplacingCharactersInRange:range withString:text];
	
	if (self.maximumCharacterCount > 0 && [finalText length] > self.maximumCharacterCount) {
		return NO;
	}
	self.maxCharacterCountLabel.text = [NSString stringWithFormat:@"%zd/%zd", finalText.length, self.maximumCharacterCount];
	
	if ([self.delegate respondsToSelector:@selector(formTableViewCellShouldWriteString:atIndexPath:)] &&
		![self.delegate formTableViewCellShouldWriteString:text atIndexPath:self.indexPath]) {
		return NO;
	}
	else {
		[self.delegate formTableViewCell:self didChangeValue:finalText atIndexPath:self.indexPath];
		return YES;
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark ACTIONS
#pragma mark -
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)onOk:(UIBarButtonItem*)sender {
	if([self.delegate respondsToSelector:@selector(formTableViewCellDidReturn:)]) {
		[self.delegate formTableViewCellDidReturn:self];
	}
	else [self resignFirstResponder];
}

@end
