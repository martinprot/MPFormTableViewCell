//
//  MPFormTextViewTableViewCell.h
//  Lafay
//
//  Created by Martin Prot on 13/07/2015.
//  Copyright (c) 2015 DEKIBAE. All rights reserved.
//

#import "MPFormTableViewCell.h"

@interface MPFormTextViewTableViewCell : MPFormTableViewCell <UITextViewDelegate>

@property (nonatomic, weak) IBOutlet UITextView *textView;

@property (nonatomic, strong) UIColor *placeholderColor;

@property (nonatomic, strong) NSString *text;

@property (nonatomic, strong) NSString *placeholder;

@property (nonatomic) NSUInteger maximumCharacterCount;

@end
