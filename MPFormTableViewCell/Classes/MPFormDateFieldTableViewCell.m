//
//  MPFormDateFieldTableViewCell.m
//  Lafay
//
//  Created by Martin Prot on 27/04/2015.
//  Copyright (c) 2015 DEKIBAE. All rights reserved.
//

#import "MPFormDateFieldTableViewCell.h"

@interface MPFormDateFieldTableViewCell ()

@property (nonatomic, strong) UIDatePicker *datePicker;

@end

@implementation MPFormDateFieldTableViewCell

- (void)awakeFromNib {
	// picker view
	self.datePicker = [UIDatePicker new];
	if(!self.datePickerMode)
		self.datePickerMode = UIDatePickerModeDate;
	if(self.currentDateTime) _datePicker.date = self.currentDateTime;
	[_datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
	self.textField.inputView = _datePicker;
	self.textField.delegate = self;
}

- (void)setCurrentDateTime:(NSDate *)currentDateTime {
	_currentDateTime = currentDateTime;
	if(currentDateTime) {
		_datePicker.date = self.currentDateTime;
		self.textField.text = [self formattedDate];
	}
	else if (self.defaultDateTime) {
		_datePicker.date = self.defaultDateTime;
	}
	else {
		_datePicker.date = [NSDate date];
	}
}

- (void)setDefaultDateTime:(NSDate *)defaultDateTime {
	_defaultDateTime = defaultDateTime;
	if(!_currentDateTime) {
		_datePicker.date = self.defaultDateTime;
	}
}

- (void)setDatePickerMode:(UIDatePickerMode)datePickerMode {
	_datePickerMode = datePickerMode;
	
	_datePicker.datePickerMode = datePickerMode;
	if (datePickerMode == UIDatePickerModeDate || datePickerMode == UIDatePickerModeDateAndTime) {
		_datePicker.maximumDate = [NSDate date];
	}
	else {
		_datePicker.maximumDate = [NSDate distantFuture];
	}
}

/**
 *  Returns the current date picker formatted date
 *
 *  @return the current date, formatted
 */
- (NSString*)formattedDate {
	NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setLocale:[NSLocale currentLocale]];
	if (self.datePickerMode == UIDatePickerModeDate)
		[dateFormatter setDateFormat:@"dd MMMM yyyy"];
	else if (self.datePickerMode == UIDatePickerModeTime)
		[dateFormatter setDateFormat:@"hh:mm"];
	else if (self.datePickerMode == UIDatePickerModeDateAndTime)
		[dateFormatter setDateFormat:@"dd MMMM yyyy hh:mm"];

	return [dateFormatter stringFromDate:self.currentDateTime];
}

- (void)dateChanged:(UIDatePicker*)picker {
	self.currentDateTime = picker.date;
	self.textField.text = [self formattedDate];
	
	[self.delegate formTableViewCell:self didChangeValue:picker.date atIndexPath:self.indexPath];
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark TEXTFIELD DELEGATE
#pragma mark -
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
	[super textFieldShouldBeginEditing:textField];
	// Auto enter text on focus
	[self dateChanged:self.datePicker];
	
	return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
	return NO;
}


@end
