#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "SlimList.h"
#include "Fixtures.h"
#import <Cocoa/Cocoa.h>

id refToSelf;

@interface ObjAdder: NSObject {
    int first;
    int second;
}
@property (readwrite,assign) int first;
@property (readwrite,assign) int second;

@end

@implementation ObjAdder
@synthesize first, second;
- (char*) doNothing
{
    return "444";
}
@end

char* otherCfunction()
{
    return [refToSelf doNothing];
}


typedef struct Adder
{
	float first;
	float second;
	char result[32];
} Adder;

void* Adder_Create(StatementExecutor* errorHandler, SlimList* args)
{
	Adder* self = (Adder*)malloc(sizeof(Adder));
//    Adder*
	memset(self, 0, sizeof(Adder));
	return self;
}

void Adder_Destroy(void* void_self)
{
	free(void_self);
}

static char* setFirst(void* void_self, SlimList* args) {
	Adder* self = (Adder*)void_self;
	self->first = atof(SlimList_GetStringAt(args, 0));
	return "";
}

static char* setSecond(void* void_self, SlimList* args) {
	Adder* self = (Adder*)void_self;
	self->second = atof(SlimList_GetStringAt(args, 0));
	return "";
}

static char* Result(void* void_self, SlimList* args) {
    ObjAdder * t = [[ObjAdder alloc] init];
    refToSelf = t;
    
    return otherCfunction();
//
//	Adder* self = (Adder*)void_self;
//	float result = self->first + self->second;
//	snprintf(self->result, 32, "%g", result);
//	return self->result;
}

//These are optional.  If they aren't declared, they are ignored
static char* execute(void* void_self, SlimList* args) {
    return "";
}

static char* reset(void* void_self, SlimList* args) {
	Adder* self = (Adder*)void_self;
    self->first = 0.0f;
    self->second = 0.0f;
    return "";
}
static char* table(void* void_self, SlimList* args) {
    return "";
}



SLIM_CREATE_FIXTURE(Adder) 
SLIM_FUNCTION(setFirst)
SLIM_FUNCTION(setSecond)
SLIM_FUNCTION(Result)
SLIM_FUNCTION(execute)
SLIM_FUNCTION(reset)
SLIM_FUNCTION(table)
SLIM_END

