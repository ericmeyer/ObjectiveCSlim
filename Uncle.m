//
//  Uncle.m
//  ObjectiveCSlim
//
//  Created by Eric Meyer on 11/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Uncle.h"


@implementation Uncle

@synthesize string;

-(id) initWithString: (NSString*) givenString {
    if ((self = [super init])) {
        self.string = givenString;
    }
    return self;
}

-(NSString*) getStringArg {
    return self.string;
}

-(void) dealloc {
    [self.string release];
    [super dealloc];
}

@end
