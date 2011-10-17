#import "Adder.h"

@implementation Adder
@synthesize first, second;

-(id) init {
    self = [super init];
    self.first = 0.0;
    self.second = 0.0;
    return self;
}

-(double) result {
    return first + second;
}

@end
