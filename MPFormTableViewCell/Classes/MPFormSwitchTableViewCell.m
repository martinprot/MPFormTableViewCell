//
//  MPFormSwitchTableViewCell.m
//  Lafay
//
//  Created by Martin Prot on 27/04/2015.
//  Copyright (c) 2015 DEKIBAE. All rights reserved.
//

#import "MPFormSwitchTableViewCell.h"

@interface MPFormSwitchTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *formLabel;
@property (nonatomic, weak) IBOutlet UISwitch *formSwitch;

@end

@implementation MPFormSwitchTableViewCell

- (void)awakeFromNib {

}

- (IBAction)valueChanged:(UISwitch*)formSwitch {
	[self.delegate formTableViewCell:self didChangeValue:@(formSwitch.on) atIndexPath:self.indexPath];
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark GETTERS
#pragma mark -
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/**
 *  Sets the label.
 *
 *  @param label the label....
 */
- (void)setLabel:(NSString *)label {
	self.formLabel.text = label;
}

/**
 *  Sets the switch state
 *
 *  @param on YES if state should be set
 */
- (void)setState:(BOOL)on {
	self.formSwitch.on = on;
}

@end
