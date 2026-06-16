//
//  AgendaViewController.m
//  Itsycal
//
//  Agenda/event list UI disabled in this fork.
//

#import "AgendaViewController.h"

@implementation AgendaViewController

- (void)loadView
{
    self.view = [NSView new];
}

- (void)reloadData
{
    self.events = @[];
}

- (void)dimEventsIfNecessary
{
}

- (BOOL)clickFirstActiveZoomButton
{
    return NO;
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return 0;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    return nil;
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row
{
    return 0;
}

@end
