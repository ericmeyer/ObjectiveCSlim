#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "SlimList.h"
#include "Fixtures.h"
#import <Cocoa/Cocoa.h>
#import "Adder.h"
#import "ObjAdderFixture.h"

ObjAdderFixture* objFixture;

void* Adder_Create(StatementExecutor* errorHandler, SlimList* args)
{
    objFixture = [[ObjAdderFixture alloc] init];
	return objFixture;
}

void Adder_Destroy(void* void_self)
{
    [objFixture release];
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
    char *string = malloc (32 * sizeof (char));
    snprintf(string, 32, "%s", [[objFixture result] UTF8String]);
    return string;
}


SLIM_CREATE_FIXTURE(Adder) 
SLIM_FUNCTION(setFirst)
SLIM_FUNCTION(setSecond)
SLIM_FUNCTION(Result)
SLIM_END

