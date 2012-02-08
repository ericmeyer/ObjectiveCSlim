#import <Foundation/Foundation.h>
#import "Adder.h"

@interface ObjAdderFixture : NSObject {
    ObjAdder* adder;
    NSNumber* first;
    NSNumber* second;
}
@property (nonatomic, retain) ObjAdder* adder;
@property (nonatomic, retain) NSNumber* first;
@property (nonatomic, retain) NSNumber* second;

-(NSString*) result;

@end
