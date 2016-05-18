//
//  MPFormAbstractTableViewCell.h
//  Lafay
//
//  Created by Martin Prot on 27/04/2015.
//  Copyright (c) 2015 DEKIBAE. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MPFormAbstractTableViewCell;

@protocol MPFormTableViewCellDelegate <NSObject>

- (void)formTableViewCell:(__kindof MPFormAbstractTableViewCell*)cell didChangeValue:(id)value atIndexPath:(NSIndexPath*)indexPath;
@optional
- (void)formTableViewCellDidFocus:(__kindof MPFormAbstractTableViewCell*)cell;
- (void)formTableViewCellDidReturn:(__kindof MPFormAbstractTableViewCell*)cell;

- (BOOL)formTableViewCellShouldWriteString:(NSString*)string atIndexPath:(NSIndexPath*)indexPath;

@end

@interface MPFormAbstractTableViewCell : UITableViewCell

@property (nonatomic, weak) id<MPFormTableViewCellDelegate> delegate;
@property (nonatomic, strong) NSIndexPath *indexPath;

- (BOOL)resignFirstResponder;

- (BOOL)becomeFirstResponder;

@end
