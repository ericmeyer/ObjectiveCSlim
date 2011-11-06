#import <Foundation/Foundation.h>

@interface TestSlim : NSObject {
    BOOL wasNoArgsCalled;
    NSString* calledWithStringArg;
}
@property (assign) BOOL wasNoArgsCalled;
@property (nonatomic, retain) NSString* calledWithStringArg;
@property (nonatomic, retain) NSString* calledWithFirstStringArg;
@property (nonatomic, retain) NSString* calledWithSecondStringArg;

-(id) initWithString: (NSString*) givenString;

-(NSString*) noArgs;
-(void) withStringArg:(NSString*) someString;
-(void) withMultipleArgs:(NSArray*) args;

@end
