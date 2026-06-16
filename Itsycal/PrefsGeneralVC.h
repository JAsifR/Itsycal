//
//  Created by Sanjay Madan on 1/11/17.
//  Copyright © 2017 mowglii.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class EventCenter;

@interface PrefsGeneralVC : NSViewController

// Kept for compatibility with the existing controller setup. Calendar access is disabled.
@property (nonatomic, weak) EventCenter *ec;

@end
