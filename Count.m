#import "Count.h"

@implementation Count

@synthesize number;

-(id) initWithString:(NSString *)startingNumber {
    if ((self = [super init])) {
        self.number = [startingNumber intValue];
    }
    return self;
}

-(id) init {
    return [self initWithString: @"0"];
}

-(NSString*) counter {
    return [NSString stringWithFormat: @"%d", self.number];
}

-(NSString*) count {
    self.number += 1;
    return nil;
}

@end
