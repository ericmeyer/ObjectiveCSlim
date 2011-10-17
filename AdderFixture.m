#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "SlimList.h"
#include "Fixtures.h"
#import <Cocoa/Cocoa.h>
#import "Adder.h"

ObjAdder* globalObjAdder;

void* Adder_Create(StatementExecutor* errorHandler, SlimList* args)
{
    globalObjAdder = [[ObjAdder alloc] init];
	return globalObjAdder;
}

void Adder_Destroy(void* void_self)
{
    [globalObjAdder release];
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
    char *string = malloc (32 * sizeof (char));
    snprintf(string, 32, "%g", [globalObjAdder result]);
    return string;
}


SLIM_CREATE_FIXTURE(Adder) 
SLIM_FUNCTION(setFirst)
SLIM_FUNCTION(setSecond)
SLIM_FUNCTION(Result)
SLIM_END

