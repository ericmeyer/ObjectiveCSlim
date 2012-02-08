#import <Foundation/Foundation.h>

@interface Count : NSObject {
    int number;
}
@property (assign) int number;

-(id) initWithString: (NSString*) startingNumber;

-(int) counter;
-(void) count;

@end
