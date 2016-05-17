//
//  MPFormDateFieldTableViewCell.h
//  Lafay
//
//  Created by Martin Prot on 27/04/2015.
//  Copyright (c) 2015 DEKIBAE. All rights reserved.
//

#import "MPFormTextFieldTableViewCell.h"

@interface MPFormDateFieldTableViewCell : MPFormTextFieldTableViewCell

@property (nonatomic) UIDatePickerMode datePickerMode;

/**
 *  The picker default date
 */
@property (nonatomic, strong) NSDate *currentDateTime;

/**
 *  The picker default date, if current date time is nil
 */
@property (nonatomic, strong) NSDate *defaultDateTime;

/**
 *  Returns the current date picker formatted date
 *
 *  @return the current date, formatted
 */
- (NSString*)formattedDate;

@end
