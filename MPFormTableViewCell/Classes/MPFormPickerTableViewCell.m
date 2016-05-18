//
//  MPFormPickerTableViewCell.m
//  iLokYou
//
//  Created by Martin Prot on 11/02/2016.
//  Copyright © 2016 Appricot media. All rights reserved.
//

#import "MPFormPickerTableViewCell.h"

@interface MPFormPickerTableViewCell ()

@property (nonatomic, strong) UIPickerView *pickerView;

@end

@implementation MPFormPickerTableViewCell

- (void)awakeFromNib {
	// picker view
	self.pickerView = [UIPickerView new];
	self.pickerView.delegate = self;
	self.pickerView.dataSource = self;
	self.textField.inputView = self.pickerView;
	
	self.textField.delegate = self;
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark SETTERS
#pragma mark -
////////////////////////////////////////////////////////////////////////////////

- (void)setSelectedValue:(NSNumber*)selectedValue {
	_selectedValue = selectedValue;
	
	if (self.values) {
		NSInteger index = [self.values indexOfObject:selectedValue];
		if (index != NSNotFound) {
			[self.pickerView selectRow:index inComponent:0 animated:NO];
			self.textField.text = self.localizedItems[index];
		}
	}
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
	_selectedIndex = selectedIndex;
	
	[self.pickerView selectRow:selectedIndex inComponent:0 animated:NO];
	self.textField.text = self.localizedItems[selectedIndex];
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark TEXT FIELD DELEGATE
#pragma mark -
////////////////////////////////////////////////////////////////////////////////

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
	[super textFieldShouldBeginEditing:textField];
	
	if (self.values) {
		NSAssert(self.values.count == self.localizedItems.count, @"Each items should correspond to a value.");
	}
	
	return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
	return NO;
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark PICKER DATASOURCE DELEGATE
#pragma mark -
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	return [self.localizedItems count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	if (row < self.localizedItems.count) {
		return self.localizedItems[row];
	}
	return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	if (row < self.localizedItems.count) {
		self.textField.text = self.localizedItems[row];
	
		if (self.values) {
			[self.delegate formTableViewCell:self didChangeValue:self.values[row] atIndexPath:self.indexPath];
		}
		else {
			[self.delegate formTableViewCell:self didChangeValue:@(row) atIndexPath:self.indexPath];
		}
	}
}



@end
