#import "TestSlim.h"

@implementation TestSlim

@synthesize wasNoArgsCalled, calledWithStringArg, calledWithFirstStringArg, calledWithSecondStringArg;

-(id) initWithString: (NSString*) givenString {
    if ((self = [super init])) {
        self.calledWithStringArg = givenString;
    }
    return self;
}

-(NSString*) noArgs {
    self.wasNoArgsCalled = YES;
    return @"return value";
}

-(void) withStringArg:(NSString*) someString {
    self.calledWithStringArg = someString;
}

-(void) withMultipleArgs:(NSArray*) args {
    self.calledWithFirstStringArg = [args objectAtIndex: 0];
    self.calledWithSecondStringArg = [args objectAtIndex: 1];
}

-(void) dealloc {
    [calledWithStringArg release];
    [calledWithFirstStringArg release];
    [calledWithSecondStringArg release];
    [super dealloc];
}



@end
