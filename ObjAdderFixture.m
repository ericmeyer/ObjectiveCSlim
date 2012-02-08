#import "ObjAdderFixture.h"

@implementation ObjAdderFixture

@synthesize adder, first, second;

-(id) init {
    if ((self = [super init])) {
        self.adder = [[ObjAdder alloc] init];
    }
    return self;
}

-(NSString*) result {
    self.adder.first = [first doubleValue];
    self.adder.second = [second doubleValue];
    return [NSString stringWithFormat: @"%g", [self.adder result]];
}

-(void) dealloc {
    [second release];
    [first release];
    [adder release];
    [super dealloc];
}

@end
