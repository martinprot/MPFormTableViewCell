//
//  MPFormTextFieldTableViewCell.h
//  Lafay
//
//  Created by Martin Prot on 27/04/2015.
//  Copyright (c) 2015 DEKIBAE. All rights reserved.
//

#import "MPFormTableViewCell.h"

extern NSInteger const kFormTextViewTableViewCellHeight;

@interface MPFormTextFieldTableViewCell : MPFormTableViewCell <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *textField;

@end
