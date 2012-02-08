#import "Count.h"

@implementation Count

@synthesize number;

-(id) initWithString:(NSNumber *)startingNumber {
    if ((self = [super init])) {
        self.number = [startingNumber intValue];
    }
    return self;
}

-(id) init {
    return [self initWithString: @"0"];
}

-(int) counter {
    return self.number;
}

-(void) count {
    self.number += 1;
}

@end
