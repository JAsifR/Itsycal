//
//  Created by Sanjay Madan on 1/11/17.
//  Copyright © 2017 mowglii.com. All rights reserved.
//

#import "PrefsGeneralVC.h"
#import "Itsycal.h"
#import "MoLoginItem.h"
#import "MoVFLHelper.h"
#import "MASShortcut/Shortcut.h"
#import "Sparkle/SUUpdater.h"

@implementation PrefsGeneralVC
{
    NSButton *_login;
    NSButton *_checkUpdates;
    NSButton *_beepBeep;
    NSPopUpButton *_firstDayPopup;
}

#pragma mark -
#pragma mark View lifecycle

- (void)loadView
{
    NSView *v = [NSView new];

    NSTextField* (^label)(NSString*) = ^NSTextField* (NSString *stringValue) {
        NSTextField *txt = [NSTextField labelWithString:stringValue];
        [v addSubview:txt];
        return txt;
    };

    NSButton* (^chkbx)(NSString *) = ^NSButton* (NSString *title) {
        NSButton *chkbx = [NSButton checkboxWithTitle:title target:self action:nil];
        [v addSubview:chkbx];
        return chkbx;
    };

    _login = chkbx(NSLocalizedString(@"Launch at login", @""));
    _login.action = @selector(launchAtLogin:);

    _checkUpdates = chkbx(NSLocalizedString(@"Automatically check for updates", @""));
    _beepBeep = chkbx(NSLocalizedString(@"Beep beep on the hour", @""));

    NSTextField *firstDayLabel = label(NSLocalizedString(@"First day of week:", @""));

    _firstDayPopup = [NSPopUpButton new];
    [_firstDayPopup addItemsWithTitles:@[NSLocalizedString(@"Sunday", @""),
                                         NSLocalizedString(@"Monday", @""),
                                         NSLocalizedString(@"Tuesday", @""),
                                         NSLocalizedString(@"Wednesday", @""),
                                         NSLocalizedString(@"Thursday", @""),
                                         NSLocalizedString(@"Friday", @""),
                                         NSLocalizedString(@"Saturday", @"")]];
    [v addSubview:_firstDayPopup];

    NSTextField *shortcutLabel = label(NSLocalizedString(@"Keyboard shortcut", @""));

    MASShortcutView *shortcutView = [MASShortcutView new];
    [shortcutView setAssociatedUserDefaultsKey:kKeyboardShortcut withTransformerName:MASDictionaryTransformerName];
    [v addSubview:shortcutView];

    MoVFLHelper *vfl = [[MoVFLHelper alloc] initWithSuperview:v metrics:@{@"m": @20} views:NSDictionaryOfVariableBindings(_login, _checkUpdates, _beepBeep, firstDayLabel, _firstDayPopup, shortcutLabel, shortcutView)];
    [vfl :@"V:|-m-[_login]-[_checkUpdates]-[_beepBeep]-20-[_firstDayPopup]-20-[shortcutLabel]-3-[shortcutView(25)]-m-|"];
    [vfl :@"H:|-m-[_login]-(>=m)-|"];
    [vfl :@"H:|-m-[_checkUpdates]-(>=m)-|"];
    [vfl :@"H:|-m-[_beepBeep]-(>=m)-|"];
    [vfl :@"H:|-m-[firstDayLabel]-[_firstDayPopup]-(>=m)-|" :NSLayoutFormatAlignAllFirstBaseline];
    [vfl :@"H:|-(>=m)-[shortcutLabel]-(>=m)-|"];
    [vfl :@"H:|-m-[shortcutView(>=220)]-m-|"];
    [v addConstraint:[NSLayoutConstraint constraintWithItem:shortcutLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:v attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];

    [_checkUpdates bind:@"value" toObject:[SUUpdater sharedUpdater] withKeyPath:@"automaticallyChecksForUpdates" options:@{NSContinuouslyUpdatesValueBindingOption: @(YES)}];
    [_beepBeep bind:@"value" toObject:[NSUserDefaultsController sharedUserDefaultsController] withKeyPath:[@"values." stringByAppendingString:kBeepBeepOnTheHour] options:@{NSContinuouslyUpdatesValueBindingOption: @(YES)}];
    [_firstDayPopup bind:@"selectedIndex" toObject:[NSUserDefaultsController sharedUserDefaultsController] withKeyPath:[@"values." stringByAppendingString:kWeekStartDOW] options:@{NSContinuouslyUpdatesValueBindingOption: @(YES)}];

    self.view = v;
}

- (void)viewWillAppear
{
    [super viewWillAppear];

    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"DoNotCheckLoginItemStatus"] == NO) {
        _login.hidden = NO;
        _login.state = MOIsLoginItemEnabled() ? NSControlStateValueOn : NSControlStateValueOff;
    }
    else {
        _login.hidden = YES;
    }
}

#pragma mark -
#pragma mark Login item

- (void)launchAtLogin:(NSButton *)login
{
    MOEnableLoginItem(login.state == NSControlStateValueOn);
}

@end
