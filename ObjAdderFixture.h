#import <Foundation/Foundation.h>
#import "Adder.h"

@interface ObjAdderFixture : NSObject {
    ObjAdder* adder;
}
@property (nonatomic, retain) ObjAdder* adder;

-(void) setFirst:(NSString*) first;
-(void) setSecond:(NSString*) second;
-(NSString*) result;

@end
