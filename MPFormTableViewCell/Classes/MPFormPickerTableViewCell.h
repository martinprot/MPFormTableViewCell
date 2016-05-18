//
//  MPFormPickerTableViewCell.h
//  iLokYou
//
//  Created by Martin Prot on 11/02/2016.
//  Copyright © 2016 Appricot media. All rights reserved.
//

#import "MPFormTextFieldTableViewCell.h"

@interface MPFormPickerTableViewCell : MPFormTextFieldTableViewCell <UIPickerViewDataSource, UIPickerViewDelegate>

/**
 *  The picker localized items
 */
@property (nonatomic, strong) NSArray *localizedItems;

/**
 *  the picker associated item values
 *  leave it null if the control should return the localizedItem selected index
 */
@property (nonatomic, strong) NSArray <NSNumber*>*values;

/**
 *  The selected value
 */
@property (nonatomic, strong) NSNumber *selectedValue;

/**
 *  The selected index
 */
@property (nonatomic) NSInteger selectedIndex;

@end
