#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "SlimList.h"
#include "Fixtures.h"
#import <Cocoa/Cocoa.h>
#import "Adder.h"


ObjAdder* objAdder;

typedef struct Adder
{
	char result[32];
} Adder;

void* Adder_Create(StatementExecutor* errorHandler, SlimList* args)
{
	Adder* self = (Adder*)malloc(sizeof(Adder));
    objAdder = [[ObjAdder alloc] init];
	memset(self, 0, sizeof(Adder));
	return self;
}

void Adder_Destroy(void* void_self)
{
    [objAdder release];
	free(void_self);
}

static char* setFirst(void* void_self, SlimList* args) {
    objAdder.first = SlimList_GetDoubleAt(args, 0);
	return "";
}

static char* setSecond(void* void_self, SlimList* args) {
    objAdder.second = SlimList_GetDoubleAt(args, 0);
	return "";
}

static char* Result(void* void_self, SlimList* args) {
	Adder* self = (Adder*)void_self;
    snprintf(self->result, 32, "%g", [objAdder result]);
    return self->result;
}

//These are optional.  If they aren't declared, they are ignored
static char* execute(void* void_self, SlimList* args) {
    return "";
}

static char* reset(void* void_self, SlimList* args) {
	[objAdder init];
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

