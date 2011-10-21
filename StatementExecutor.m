#import "StatementExecutor.h"

//void StatementExecutor_Destroy(StatementExecutor*);
//
//void StatementExecutor_AddFixture(StatementExecutor* executor, Fixture);
//void StatementExecutor_RegisterFixture(StatementExecutor*, char const * className, Constructor, Destructor);
//void StatementExecutor_RegisterMethod(StatementExecutor*, char const * className, char const * methodName, Method);
//
//char* StatementExecutor_Make(StatementExecutor*, char const* instanceName, char const* className, SlimList* args);
//char* StatementExecutor_Call(StatementExecutor*, char const* instanceName, char const* methodName, SlimList*);
//void* StatementExecutor_Instance(StatementExecutor*, char const* instanceName);
//void StatementExecutor_SetSymbol(StatementExecutor*, char const* symbol, char const* value);
//
//void StatementExecutor_ConstructorError(StatementExecutor* executor, char const* message);
//char* StatementExecutor_FixtureError(char const* message);

struct StatementExecutor
{
    id instance;
};

StatementExecutor* StatementExecutor_Create(void) {
	StatementExecutor* self = (StatementExecutor*)malloc(sizeof(StatementExecutor));
	memset(self, 0, sizeof(StatementExecutor));
	return self;
}

void* StatementExecutor_Instance(StatementExecutor* executor, char const* instanceName) {
    return executor->instance;
}

char* StatementExecutor_Make(StatementExecutor* executor, char const* instanceName, char const* className, SlimList* args){
    executor->instance = [[NSClassFromString([NSString stringWithFormat: @"%s", className]) alloc] init];
    return "OK";
}

char* StatementExecutor_Call(StatementExecutor* executor, char const* instanceName, char const* methodName, SlimList* args){
    return nil;
}

void StatementExecutor_SetSymbol(StatementExecutor* self, char const* symbol, char const* value) {
}


void StatementExecutor_Destroy(StatementExecutor* self) {
    free(self);
}

void AddFixtures(StatementExecutor* executor) {
    
}