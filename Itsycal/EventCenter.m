//
//  EventCenter.m
//  Itsycal
//
//  Calendar and event access disabled in this fork.
//

#import "EventCenter.h"

@implementation CalendarInfo @end
@implementation EventInfo @end

@implementation EventCenter

- (instancetype)initWithCalendar:(NSCalendar *)calendar delegate:(id<EventCenterDelegate>)delegate {
    self = [super init];
    if (self) {
        _delegate = delegate;
    }
    return self;
}

- (BOOL)calendarAccessGranted {
    return NO;
}

- (NSString *)defaultCalendarIdentifier {
    return nil;
}

- (EKEvent *)newEvent {
    return nil;
}

- (BOOL)saveEvent:(EKEvent *)event error:(NSError **)error {
    return NO;
}

- (BOOL)removeEvent:(EKEvent *)event span:(EKSpan)span error:(NSError **)error {
    return NO;
}

- (void)fetchEvents {
    [self.delegate eventCenterEventsChanged];
}

- (NSArray *)sourcesAndCalendars {
    return @[];
}

- (NSDictionary *)filteredEventsForDate {
    return @{};
}

- (void)updateSelectedCalendarsForIdentifier:(NSString *)identifier selected:(BOOL)selected {
}

- (void)refetchAll {
    [self.delegate eventCenterEventsChanged];
}

- (void)refresh {
}

@end
