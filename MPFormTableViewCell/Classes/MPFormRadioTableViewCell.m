//
//  MPFormRadioTableViewCell.m
//  Lafay
//
//  Created by Martin Prot on 27/04/2015.
//  Copyright (c) 2015 DEKIBAE. All rights reserved.
//

#import "MPFormRadioTableViewCell.h"

@interface MPFormRadioTableViewCell ()

@property (nonatomic, weak) IBOutlet UIButton *leftChoiceRadioButton;
@property (nonatomic, weak) IBOutlet UIButton *rightChoiceRadioButton;

@end

@implementation MPFormRadioTableViewCell


/**
 *  Sets the title for the given choice
 *
 *  @param title  the title
 *  @param choice the choice
 */
- (void)setTitle:(NSString*)title forChoice:(MPFormRadioChoice)choice {
	if(choice == MPFormRadioChoiceLeft) {
		[_leftChoiceRadioButton setTitle:title forState:UIControlStateNormal];
	}
	else {
		[_rightChoiceRadioButton setTitle:title forState:UIControlStateNormal];
	}
}

/**
 *  Sets the choice to display
 *
 *  @param choice the choice
 */
- (void)setChoice:(MPFormRadioChoice)choice {
	if (choice == MPFormRadioChoiceLeft) {
		_rightChoiceRadioButton.selected = NO;
		_leftChoiceRadioButton.selected = YES;
	}
	else {
		_rightChoiceRadioButton.selected = YES;
		_leftChoiceRadioButton.selected = NO;
	}
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark ACTIONS
#pragma mark -
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (IBAction)onLeftRadio:(id)sender {
	_rightChoiceRadioButton.selected = NO;
	_leftChoiceRadioButton.selected = YES;
	
	[self.delegate formTableViewCell:self didChangeValue:@(MPFormRadioChoiceLeft) atIndexPath:self.indexPath];
}

- (IBAction)onRightRadio:(id)sender {
	_rightChoiceRadioButton.selected = YES;
	_leftChoiceRadioButton.selected = NO;
	
	[self.delegate formTableViewCell:self didChangeValue:@(MPFormRadioChoiceRight) atIndexPath:self.indexPath];
}

@end
