#import "StatementExecutor.h"

SEL NSSelectorFromCStringAndLength(char const* methodName, int numberOrArguments);
NSString* SlimList_GetNSStringAt(SlimList* self, int index);
char* noMethodErrorFor(char const* methodName, int length);
NSArray* SlimList_ToNSArray(SlimList* self);

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
    Class class = NSClassFromString([NSString stringWithFormat: @"%s", className]);
    if(class == nil) {
        [executor->instances removeObjectForKey: [NSString stringWithFormat: @"%s", instanceName]];
        char *errorMessage = malloc (128 * sizeof (char));
        snprintf(errorMessage, 128, "%s", [[NSString stringWithFormat: @"__EXCEPTION__:message:<<NO_CLASS %s.>>", className] UTF8String]);
        return errorMessage;
    } else {
        int length = SlimList_GetLength(args);
        @try {
            if(length == 0) {
                id instance = [[class alloc] init];
                [executor->instances setValue: instance
                                       forKey: [NSString stringWithFormat: @"%s", instanceName]];
            } else {
                id instance = [[class alloc] initWithString: SlimList_GetNSStringAt(args, 0)];
                [executor->instances setValue: instance
                                       forKey: [NSString stringWithFormat: @"%s", instanceName]];
            }
        }
        @catch (NSException* exception) {
            return "__EXCEPTION__:message:<<COULD_NOT_INVOKE_CONSTRUCTOR TestSlimTwo xxx.>>";
        }
        return "OK";
    }
}

char* StatementExecutor_Call(StatementExecutor* executor, char const* instanceName, char const* methodName, SlimList* args){
    id instance = StatementExecutor_Instance(executor, instanceName);
    int length = SlimList_GetLength(args);
    SEL selector = NSSelectorFromCStringAndLength(methodName, length);
    char *result = malloc (32 * sizeof (char));
    if(instance == NULL) {
        char *errorMessage = malloc (128 * sizeof (char));
        snprintf(errorMessage, 128, "%s", [[NSString stringWithFormat: @"__EXCEPTION__:message:<<The instance %s. does not exist>>", instanceName] UTF8String]);
        return errorMessage;
    }
    if(![instance respondsToSelector: selector]) {
        return noMethodErrorFor(methodName, length);
    }
    if(length == 0) {
        snprintf(result, 32, "%s", [[instance performSelector: selector] UTF8String]);
        return result;
    } else if (length == 1) {
        [instance performSelector: selector withObject: SlimList_GetNSStringAt(args, 0)];
    } else {
        [instance performSelector: selector withObject: SlimList_ToNSArray(args)];
    }
    
    return "OK";
}

void StatementExecutor_SetSymbol(StatementExecutor* self, char const* symbol, char const* value) {
}


void StatementExecutor_Destroy(StatementExecutor* self) {
    free(self);
}


void StatementExecutor_AddFixture(StatementExecutor* executor, Fixture fixture) {
}
void StatementExecutor_RegisterFixture(StatementExecutor* executor, char const * className, Constructor constructor, Destructor destructor){
}
void StatementExecutor_RegisterMethod(StatementExecutor* executor, char const * className, char const * methodName, Method method){
}

SEL NSSelectorFromCStringAndLength(char const* methodName, int numberOrArguments) {
    if (numberOrArguments == 0) {
        return NSSelectorFromString([NSString stringWithFormat:@"%s", methodName]);
    } else {
        return NSSelectorFromString([NSString stringWithFormat:@"%s:", methodName]);
    }
}

NSArray* SlimList_ToNSArray(SlimList* self) {
    int length = SlimList_GetLength(self);
    NSMutableArray* array = [NSMutableArray array];
    for(int i=0; i<length; i++) {
        [array addObject: SlimList_GetNSStringAt(self, i)];
    }
    return array;
}

char* noMethodErrorFor(char const* methodName, int length) {
    NSString* errorMessage = [NSString stringWithFormat: @"__EXCEPTION__:message:<<NO_METHOD_IN_CLASS %s[%d] TestSlim.>>", methodName, length];
    char *string = malloc (128 * sizeof (char));
    snprintf(string, 128, "%s", [errorMessage UTF8String]);
    return string;
}
NSString* SlimList_GetNSStringAt(SlimList* self, int index) {
    return [NSString stringWithFormat:@"%s", SlimList_GetStringAt(self, index)];
}