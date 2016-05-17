//
//  MPFormTableViewCell.h
//  Lafay
//
//  Created by Martin Prot on 27/04/2015.
//  Copyright (c) 2015 DEKIBAE. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const kMPFormTextFieldTableViewCell;
extern NSString * const kMPFormTextViewTableViewCell;
extern NSString * const kMPFormPickerTableViewCell;
extern NSString * const kMPFormDateFieldTableViewCell;
extern NSString * const kMPFormRadioTableViewCell;
extern NSString * const kMPFormSwitchTableViewCell;

@class MPFormTableViewCell;

@protocol MPFormTableViewCellDelegate <NSObject>

- (void)formTableViewCell:(MPFormTableViewCell*)cell didChangeValue:(id)value atIndexPath:(NSIndexPath*)indexPath;
@optional
- (void)formTableViewCellDidFocus:(MPFormTableViewCell*)cell;
- (void)formTableViewCellDidReturn:(MPFormTableViewCell*)cell;

- (BOOL)formTableViewCellShouldWriteString:(NSString*)string atIndexPath:(NSIndexPath*)indexPath;

@end

@interface MPFormTableViewCell : UITableViewCell

@property (nonatomic, weak) id<MPFormTableViewCellDelegate> delegate;
@property (nonatomic, strong) NSIndexPath *indexPath;

- (BOOL)resignFirstResponder;

- (BOOL)becomeFirstResponder;

@end
