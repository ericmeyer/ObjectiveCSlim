//
//  ObjectiveCSlimAppDelegate.h
//  ObjectiveCSlim
//
//  Created by Eric Meyer on 10/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ObjectiveCSlimAppDelegate : NSObject <NSApplicationDelegate> {
@private
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
