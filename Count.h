#import <Foundation/Foundation.h>

@interface Count : NSObject {
    int number;
}
@property (assign) int number;

-(id) initWithString: (NSString*) startingNumber;

-(NSString*) counter;
-(NSString*) count;

@end
