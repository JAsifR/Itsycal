//
//  AgendaViewController.h
//  Itsycal
//
//  Agenda/event list UI disabled in this fork.
//

#import <Cocoa/Cocoa.h>

@protocol AgendaDelegate;

@interface AgendaViewController : NSViewController <NSTableViewDataSource, NSTableViewDelegate, NSMenuDelegate>

@property (nonatomic, weak) NSCalendar *nsCal;
@property (nonatomic) NSTableView *tv;
@property (nonatomic) NSArray *events;
@property (nonatomic, weak) id<AgendaDelegate> delegate;
@property (nonatomic) BOOL showLocation;

- (void)reloadData;
- (void)dimEventsIfNecessary;
- (BOOL)clickFirstActiveZoomButton;

@end

@class EKEvent;

@protocol AgendaDelegate <NSObject>

@optional
- (void)agendaHoveredOverRow:(NSInteger)row;
- (void)agendaWantsToDeleteEvent:(EKEvent *)event;
- (void)agendaShowCalendarAppAtDate:(NSDate *)date;
- (CGFloat)agendaMaxPossibleHeight;

@end
