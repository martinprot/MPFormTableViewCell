//
//  MPViewController.m
//  MPFormTableViewCell
//
//  Created by Martin Prot on 05/17/2016.
//  Copyright (c) 2016 Martin Prot. All rights reserved.
//

#import "MPViewController.h"

typedef NS_ENUM(int, MPFormField) {
	MPFormFieldUnit,
	MPFormFieldDate,
	MPFormFieldRecurrency
};

static NSString *const kCellId = @"kCellId";
static NSString *const kFieldId = @"kFieldId";

@interface MPViewController ()

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *formDataSource;
@property (nonatomic, strong) NSMutableDictionary *resultsDataSource;

@property (nonatomic, strong) NSArray *units;
@property (nonatomic, strong) NSArray *recurrencies;

@end

@implementation MPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	NSBundle *bundle = [NSBundle bundleForClass:MPFormAbstractTableViewCell.class];
	[self.tableView registerNib:[UINib nibWithNibName:@"MPFormSegmentedTableViewCell" bundle:bundle] forCellReuseIdentifier:kMPFormSegmentedTableViewCell];
	[self.tableView registerNib:[UINib nibWithNibName:@"MPFormDateFieldTableViewCell" bundle:bundle] forCellReuseIdentifier:kMPFormDateFieldTableViewCell];
	[self.tableView registerNib:[UINib nibWithNibName:@"MPFormPickerTableViewCell" bundle:bundle] forCellReuseIdentifier:kMPFormPickerTableViewCell];

	
	self.formDataSource = @[// first section
							@[// first row
							  @{kCellId:kMPFormSegmentedTableViewCell, kFieldId: @(MPFormFieldUnit)}
							 ],
							// second section
							@[@{kCellId:kMPFormDateFieldTableViewCell, kFieldId: @(MPFormFieldDate)},
							  @{kCellId:kMPFormPickerTableViewCell, kFieldId: @(MPFormFieldRecurrency)}
							 ]
							];
	self.resultsDataSource = [@{} mutableCopy];
	
	self.units = @[@"kb/s", @"Mb/s", @"ko/s", @"Mo/s"];
	self.recurrencies = @[NSLocalizedString(@"tous les jours", nil),
						  NSLocalizedString(@"toutes les semaines", nil),
						  NSLocalizedString(@"tous les mois", nil)];
}


////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark TABLE VIEW DATASOURCE
#pragma mark -
////////////////////////////////////////////////////////////////////////////////

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return [self.formDataSource count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.formDataSource[section] count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString *cellIdentifier = self.formDataSource[indexPath.section][indexPath.row][kCellId];
	UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

	return cell;
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(MPFormAbstractTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	cell.delegate = self;
	cell.indexPath = indexPath;
	
	MPFormField field = [self.formDataSource[indexPath.section][indexPath.row][kFieldId] intValue];
	switch (field) {
		case MPFormFieldUnit: {
			MPFormSegmentedTableViewCell *c = (MPFormSegmentedTableViewCell*)cell;
			c.segmentsArray = self.units;
			break;
		}
		case MPFormFieldDate: {
			MPFormDateFieldTableViewCell *c = (MPFormDateFieldTableViewCell*)cell;
			c.datePickerMode = UIDatePickerModeDate;
			c.currentDateTime = self.resultsDataSource[@(field)];
			c.defaultDateTime = [NSDate date];
			c.textField.placeholder = NSLocalizedString(@"date", nil);
			break;
		}
		case MPFormFieldRecurrency: {
			MPFormPickerTableViewCell *c = (MPFormPickerTableViewCell*)cell;
			c.localizedItems = self.recurrencies;
			c.selectedValue = self.resultsDataSource[@(field)];
			c.textField.placeholder = NSLocalizedString(@"tous les...", nil);
			break;
		}
		default:
			break;
	}
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark FORM VIEW CELL DELEGATE
#pragma mark -
////////////////////////////////////////////////////////////////////////////////

- (BOOL)formTableViewCellShouldWriteString:(NSString*)string atIndexPath:(NSIndexPath*)indexPath {
	return YES;
}

- (void)formTableViewCell:(__kindof MPFormAbstractTableViewCell*)cell didChangeValue:(id)value atIndexPath:(NSIndexPath*)indexPath {
	MPFormField field = [self.formDataSource[indexPath.section][indexPath.row][kFieldId] intValue];
	self.resultsDataSource[@(field)] = value;
	NSLog(@"%@", value);
}

- (void)formTableViewCellDidFocus:(__kindof MPFormAbstractTableViewCell*)cell {
}

- (void)formTableViewCellDidReturn:(__kindof MPFormAbstractTableViewCell*)cell {
	NSIndexPath *indexPath = cell.indexPath;
	if(indexPath.row < [self.tableView numberOfRowsInSection:indexPath.section]-1) {
		MPFormAbstractTableViewCell *cell = (MPFormAbstractTableViewCell*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row +1 inSection:indexPath.section]];
		[cell becomeFirstResponder];
	}
	else {
		[cell resignFirstResponder];
	}
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark TABLE VIEW DELEGATE
#pragma mark -
////////////////////////////////////////////////////////////////////////////////

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

@end
