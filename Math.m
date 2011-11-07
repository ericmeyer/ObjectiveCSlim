#import "Math.h"

@implementation Math

@synthesize numbers;

-(id) initWithArray:(NSArray *)givenArray {
    if ((self = [super init])) {
        self.numbers = [NSMutableArray array];
        for (NSString* stringNumber in givenArray) {
            [self.numbers addObject: [NSNumber numberWithInt: [stringNumber intValue]]];
        }
    }
    return self;
}

-(NSString*) sum {
    int total = 0;
    for (NSNumber* number in self.numbers) {
        total += [number intValue];
    }
    return [NSString stringWithFormat: @"%d", total];
}

-(NSString*) length {
    return [NSString stringWithFormat :@"%d", [self.numbers count] ];
}

-(NSString*) max {
    int max = [[self.numbers objectAtIndex:0] intValue];
    for (NSNumber* number in self.numbers) {
        if([number intValue] > max) {
            max = [number intValue];
        }
    }
    return [NSString stringWithFormat :@"%d", max];
}

@end
