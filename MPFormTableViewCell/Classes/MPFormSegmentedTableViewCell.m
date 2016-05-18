//
//  MPFormSegmentedTableViewCell.m
//  Pods
//
//  Created by Martin Prot on 18/05/2016.
//
//

#import "MPFormSegmentedTableViewCell.h"

@interface MPFormSegmentedTableViewCell ()

@property (nonatomic, weak) IBOutlet UISegmentedControl *segmentedControl;

@end

@implementation MPFormSegmentedTableViewCell

- (void)awakeFromNib {
	[super awakeFromNib];
	
	if ([self.segmentedControl allTargets].count == 0) {
		[self.segmentedControl addTarget:self action:@selector(onSegmentChanged:) forControlEvents:UIControlEventValueChanged];
	}
}

- (void)setSegmentsArray:(NSArray <NSString*>*)segmentsArray {
	_segmentsArray = segmentsArray;
	
	[self.segmentedControl removeAllSegments];
	[_segmentsArray enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		[self.segmentedControl insertSegmentWithTitle:obj atIndex:idx animated:NO];
	}];
}

- (IBAction)onSegmentChanged:(UISegmentedControl*)sender {
	[self.delegate formTableViewCell:self didChangeValue:@(sender.selectedSegmentIndex) atIndexPath:self.indexPath];
}

@end
