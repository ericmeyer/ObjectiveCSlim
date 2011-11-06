#import "Count.h"

@implementation Count

@synthesize number;

-(id) init {
    if ((self = [super init])) {
        self.number = 0;
    }
    return self;
}
-(NSString*) counter {
    return [NSString stringWithFormat: @"%d", self.number];
}

-(NSString*) count {
    self.number += 1;
    return nil;
}

@end
