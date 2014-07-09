#import "ViewController.h"
#import <FoodInspections/FoodInspections.h>

@interface ViewController ()
@end

@implementation ViewController
@synthesize textBox;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// Grab a firm and its inspections
	FIFirm *firm = [FIFirm loadById:30737];
	NSArray *inspections = [firm inspections];
	
	// Set up a string to build text
	NSMutableString *text = [[NSMutableString alloc] init];
	
	// Firm details
	[text appendFormat:@"%@\n", firm.name];
	[text appendFormat:@"  ID:          %d\n", firm.firmId];
	[text appendFormat:@"  Address:     %@\n", firm.name];
	[text appendFormat:@"  Parent:      %@\n", firm.parentName];
	[text appendFormat:@"  Critical:    %d\n", firm.totalCritical];
	[text appendFormat:@"  Noncritical: %d\n", firm.totalNoncritical];
	[text appendFormat:@"  Location:    (%f, %f)\n", firm.coordinate.latitude, firm.coordinate.longitude];
	
	// Inspection details
	for (FIInspection *inspection in inspections) {
		[text appendString:@"\n\n"];
		[text appendFormat:@"Inspection %d\n", inspection.databaseId];
		[text appendFormat:@"  Date:            %@\n", inspection.date];
		[text appendFormat:@"  Business type:   %d\n", inspection.businessType];
		[text appendFormat:@"  Inspection type: %d\n", inspection.inspectionType];
		[text appendFormat:@"  Critical:        %d\n", inspection.criticalViolations];
		[text appendFormat:@"  Noncritical:     %d\n", inspection.noncriticalViolations];
		[text appendFormat:@"  Followup:        %d\n", inspection.followup];
	}
	
	// Display the text
	textBox.text = text;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
