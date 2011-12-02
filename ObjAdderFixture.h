#import <Foundation/Foundation.h>
#import "Adder.h"

@interface ObjAdderFixture : NSObject {
    ObjAdder* adder;
}
@property (nonatomic, retain) ObjAdder* adder;

-(NSString*) setFirst:(NSString*) first;
-(NSString*) setSecond:(NSString*) second;
-(NSString*) result;

@end
