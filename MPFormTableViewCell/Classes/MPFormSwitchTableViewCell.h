//
//  MPFormSwitchTableViewCell.h
//  Lafay
//
//  Created by Martin Prot on 27/04/2015.
//  Copyright (c) 2015 DEKIBAE. All rights reserved.
//

#import "MPFormAbstractTableViewCell.h"

@interface MPFormSwitchTableViewCell : MPFormAbstractTableViewCell

/**
 *  Sets the switch state
 *
 *  @param on YES if state should be set
 */
- (void)setState:(BOOL)on;

@end
