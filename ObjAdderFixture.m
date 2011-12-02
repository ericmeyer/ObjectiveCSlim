#import "ObjAdderFixture.h"

@implementation ObjAdderFixture

@synthesize adder;

-(id) init {
    if ((self = [super init])) {
        self.adder = [[ObjAdder alloc] init];
    }
    return self;
}
-(NSString*) setFirst:(NSString *)first {
    self.adder.first = [first doubleValue];
    return @"OK";
}

-(NSString*) setSecond:(NSString *)second {
    self.adder.second = [second doubleValue];
    return @"OK";
}

-(NSString*) result {
    return [NSString stringWithFormat: @"%g", [self.adder result]];
}

-(void) dealloc {
    [self.adder release];
    [super dealloc];
}

@end
