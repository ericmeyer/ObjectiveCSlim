#import "TestQuery.h"
#import "SlimList.h"
#import "SlimListSerializer.h"

@implementation TestQuery

@synthesize number;

-(id) initWithString:(NSString*) givenString {
    if ((self = [super init])) {
        self.number = [givenString intValue];
    }
    return self;
}

-(NSString*) query {
    NSLog(@"number :%d", self.number);
    SlimList* list = SlimList_Create();
    SlimList* subList = SlimList_Create();
    SlimList* subSubList = SlimList_Create();
    SlimList_AddString(subSubList, "n");
    SlimList_AddString(subSubList, "1");
    SlimList* subSubList2 = SlimList_Create();
    SlimList_AddString(subSubList2, "2n");
    SlimList_AddString(subSubList2, "2");
    SlimList_AddList(subList, subSubList);
    SlimList_AddList(subList, subSubList2);
    SlimList_AddList(list, subList);
    return [NSString stringWithUTF8String: SlimList_Serialize(list)];
}

@end
