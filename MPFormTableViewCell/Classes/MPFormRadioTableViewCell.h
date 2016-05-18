//
//  MPFormRadioTableViewCell.h
//  Lafay
//
//  Created by Martin Prot on 27/04/2015.
//  Copyright (c) 2015 DEKIBAE. All rights reserved.
//

#import "MPFormAbstractTableViewCell.h"

typedef NS_ENUM(NSInteger, MPFormRadioChoice) {
	MPFormRadioChoiceLeft,
	MPFormRadioChoiceRight
};

@interface MPFormRadioTableViewCell : MPFormAbstractTableViewCell


/**
 *  Sets the title for the given choice
 *
 *  @param title  the title
 *  @param choice the choice
 */
- (void)setTitle:(NSString*)title forChoice:(MPFormRadioChoice)choice;

/**
 *  Sets the choice to display
 *
 *  @param choice the choice
 */
- (void)setChoice:(MPFormRadioChoice)choice;

@end
