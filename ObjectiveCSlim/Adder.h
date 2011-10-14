@interface ObjAdder: NSObject {
    double first;
    double second;
}
@property (readwrite,assign) double first;
@property (readwrite,assign) double second;

-(double) result;

@end