//
//  MPFormSegmentedTableViewCell.h
//  Pods
//
//  Created by Martin Prot on 18/05/2016.
//
//

#import "MPFormAbstractTableViewCell.h"

@interface MPFormSegmentedTableViewCell : MPFormAbstractTableViewCell

/**
 *  The segments localized names
 */
@property (nonatomic, strong) NSArray <NSString*>*segmentsArray;

/**
 *  The selected index, or negative value if nothing selected
 */
@property (nonatomic) NSInteger selectedIndex;

@end
