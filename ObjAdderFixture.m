#import "ObjAdderFixture.h"

@implementation ObjAdderFixture

@synthesize adder;

-(id) init {
    if ((self = [super init])) {
        self.adder = [[ObjAdder alloc] init];
    }
    return self;
}
-(void) setFirst:(NSString *)first {
    self.adder.first = [first doubleValue];
}

-(void) setSecond:(NSString *)second {
    self.adder.second = [second doubleValue];
}

-(NSString*) result {
    return [NSString stringWithFormat: @"%g", [self.adder result]];
}

-(void) dealloc {
    [self.adder release];
    [super dealloc];
}

@end
