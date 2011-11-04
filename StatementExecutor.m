#import "StatementExecutor.h"

SEL NSSelectorFromCString(char const* c_string);
NSString* SlimList_GetNSStringAt(SlimList* self, int index);
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
    NSMutableDictionary* instances;
};

StatementExecutor* StatementExecutor_Create(void) {
	StatementExecutor* self = (StatementExecutor*)malloc(sizeof(StatementExecutor));
	memset(self, 0, sizeof(StatementExecutor));
    self->instances = [NSMutableDictionary dictionary];
	return self;
}

void* StatementExecutor_Instance(StatementExecutor* executor, char const* instanceName) {
    return [executor->instances valueForKey: [NSString stringWithFormat: @"%s", instanceName]];
}

char* StatementExecutor_Make(StatementExecutor* executor, char const* instanceName, char const* className, SlimList* args){
    [executor->instances setValue: [[NSClassFromString([NSString stringWithFormat: @"%s", className]) alloc] init]
                           forKey: [NSString stringWithFormat: @"%s", instanceName]];
    NSLog(@"dictionary: %@", executor->instances);
    return "OK";
}

char* StatementExecutor_Call(StatementExecutor* executor, char const* instanceName, char const* methodName, SlimList* args){
    id instance = StatementExecutor_Instance(executor, instanceName);
    int length = SlimList_GetLength(args);
    if(length == 0) {
        [instance performSelector: NSSelectorFromCString(methodName)];
    } else if (length == 1) {
        NSString* string = [NSString stringWithFormat:@"%s:", methodName];
        [instance performSelector: NSSelectorFromString(string) withObject: SlimList_GetNSStringAt(args, 0)];
    } else {
        NSString* string = [NSString stringWithFormat:@"%s:", methodName];
        NSMutableArray* newArgs = [NSMutableArray array];
        for(int i=0; i<length; i++) {
            [newArgs addObject: SlimList_GetNSStringAt(args, i)];
        }
        [instance performSelector: NSSelectorFromString(string) withObject: newArgs];
    }
    
    return "OK";
}

void StatementExecutor_SetSymbol(StatementExecutor* self, char const* symbol, char const* value) {
}


void StatementExecutor_Destroy(StatementExecutor* self) {
    free(self);
}

void AddFixtures(StatementExecutor* executor) {
    
}

SEL NSSelectorFromCString(char const* c_string) {
    return NSSelectorFromString([NSString stringWithFormat:@"%s", c_string]);
}

NSString* SlimList_GetNSStringAt(SlimList* self, int index) {
    return [NSString stringWithFormat:@"%s", SlimList_GetStringAt(self, index)];
}