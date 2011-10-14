#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "SlimList.h"
#include "Fixtures.h"
#import <Cocoa/Cocoa.h>
#import "Adder.h"

ObjAdder* globalObjAdder;

typedef struct Adder
{
	char result[32];
} Adder;

void* Adder_Create(StatementExecutor* errorHandler, SlimList* args)
{
	Adder* self = (Adder*)malloc(sizeof(Adder));
    globalObjAdder = [[ObjAdder alloc] init];
	memset(self, 0, sizeof(Adder));
	return self;
}

void Adder_Destroy(void* void_self)
{
    [globalObjAdder release];
	free(void_self);
}

static char* setFirst(void* void_self, SlimList* args) {
    globalObjAdder.first = SlimList_GetDoubleAt(args, 0);
	return "";
}

static char* setSecond(void* void_self, SlimList* args) {
    globalObjAdder.second = SlimList_GetDoubleAt(args, 0);
	return "";
}

static char* Result(void* void_self, SlimList* args) {
	Adder* self = (Adder*)void_self;
    snprintf(self->result, 32, "%g", [globalObjAdder result]);
    return self->result;
}


SLIM_CREATE_FIXTURE(Adder) 
SLIM_FUNCTION(setFirst)
SLIM_FUNCTION(setSecond)
SLIM_FUNCTION(Result)
SLIM_END

