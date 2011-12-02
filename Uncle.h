//
//  Uncle.h
//  ObjectiveCSlim
//
//  Created by Eric Meyer on 11/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Uncle : NSObject {
    NSString* string;
}
@property (nonatomic, retain) NSString* string;

-(id) initWithString: (NSString*) givenString;

@end
