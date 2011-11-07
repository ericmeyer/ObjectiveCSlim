#import <Foundation/Foundation.h>

@interface Math : NSObject {
    NSMutableArray* numbers;
}
@property (nonatomic, retain) NSMutableArray* numbers;

-(id) initWithArray: (NSArray*) givenArray;

-(NSString*) sum;

@end
