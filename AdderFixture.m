#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "SlimList.h"
#include "Fixtures.h"
#import <Cocoa/Cocoa.h>
#import "Adder.h"
#import "ObjAdderFixture.h"

ObjAdderFixture* objFixture;

typedef struct Adder
{
	char result[32];
} Adder;

void* Adder_Create(StatementExecutor* errorHandler, SlimList* args)
{
	Adder* self = (Adder*)malloc(sizeof(Adder));
    objFixture = [[ObjAdderFixture alloc] init];
	memset(self, 0, sizeof(Adder));
	return self;
}

void Adder_Destroy(void* void_self)
{
    [objFixture release];
	free(void_self);
}

static char* setFirst(void* void_self, SlimList* args) {
    NSString* string = [NSString stringWithFormat:@"%s" , SlimList_GetStringAt(args, 0)];
    [objFixture setFirst: string];
    [string release];
	return "";
}

static char* setSecond(void* void_self, SlimList* args) {
    NSString* string = [NSString stringWithFormat:@"%s" , SlimList_GetStringAt(args, 0)];
    [objFixture setSecond: string];
    [string release];
	return "";
}

static char* Result(void* void_self, SlimList* args) {
	Adder* self = (Adder*)void_self;
    snprintf(self->result, 32, "%s", [[objFixture result] UTF8String]);
    printf("first: %g", objFixture.adder.first);
    return self->result;
}


SLIM_CREATE_FIXTURE(Adder) 
SLIM_FUNCTION(setFirst)
SLIM_FUNCTION(setSecond)
SLIM_FUNCTION(Result)
SLIM_END

