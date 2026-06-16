//
//  DatePickerVC.m
//  Itsycal
//

#import "DatePickerVC.h"

@implementation DatePickerVC

- (instancetype)initWithMoCal:(MoCalendar *)moCal nsCal:(NSCalendar *)nsCal
{
    self = [super init];
    return self;
}

- (void)loadView
{
    self.view = [NSView new];
}

@end
