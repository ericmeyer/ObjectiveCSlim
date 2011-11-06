#import "OCDSpec/OCDSpec.h"
#import "StatementExecutor.h"
#import "TestSlim.h"

CONTEXT(StatementExecutor)
{
    describe(@"slim class",
             it(@"makes an instance of a class",
                ^{
                    SlimList* empty = SlimList_Create();
                    StatementExecutor* statementExecutor = StatementExecutor_Create();
                    StatementExecutor_Make(statementExecutor, "test_slim", "TestSlim", empty);
                    id test_slim_instance = StatementExecutor_Instance(statementExecutor, "test_slim");

                    bool isTestSlimClass = [test_slim_instance isKindOfClass: [TestSlim class]];
                    expectTruth(isTestSlimClass);
                }),
             it(@"makes a different instance of a class",
                ^{
                    SlimList* empty = SlimList_Create();
                    SlimList* args = SlimList_Create();
                    StatementExecutor* statementExecutor = StatementExecutor_Create();
                    StatementExecutor_Make(statementExecutor, "test_slim", "TestSlim", empty);
                    StatementExecutor_Make(statementExecutor, "test_slim_2", "TestSlim", empty);
                    TestSlim* test_slim_instance = (TestSlim*)StatementExecutor_Instance(statementExecutor, "test_slim");
                    TestSlim* test_slim_instance_2 = (TestSlim*)StatementExecutor_Instance(statementExecutor, "test_slim_2");
                    StatementExecutor_Call(statementExecutor, "test_slim", "noArgs", args);
                    
                    NSLog(@"test_slim_instance: %@", test_slim_instance);
                    NSLog(@"test_slim_instance_2: %@", test_slim_instance_2);

                    expectTruth(test_slim_instance.wasNoArgsCalled);
                    expectFalse(test_slim_instance_2.wasNoArgsCalled);
                }),
             it(@"calls a function with no args",
                ^{
                    SlimList* empty = SlimList_Create();
                    SlimList* args = SlimList_Create();
                    StatementExecutor* statementExecutor = StatementExecutor_Create();
                    StatementExecutor_Make(statementExecutor, "test_slim", "TestSlim", empty);
                    StatementExecutor_Call(statementExecutor, "test_slim", "noArgs", args);
                    
                    TestSlim* test_slim_instance = (TestSlim*)StatementExecutor_Instance(statementExecutor, "test_slim");
                    expectTruth(test_slim_instance.wasNoArgsCalled);
                }),
            it(@"returns what the method that takes no arguments returns",
                ^{
                    SlimList* empty = SlimList_Create();
                    SlimList* args = SlimList_Create();
                    StatementExecutor* statementExecutor = StatementExecutor_Create();
                    StatementExecutor_Make(statementExecutor, "test_slim", "TestSlim", empty);
                    TestSlim* test_slim_instance = (TestSlim*)StatementExecutor_Instance(statementExecutor, "test_slim");

                    NSString* result = [NSString stringWithFormat: @"%s", StatementExecutor_Call(statementExecutor, "test_slim", "noArgs", args)];
                    
                    [expect(result) toBeEqualTo: [test_slim_instance noArgs]];
                }),
             it(@"returns an error if the function with no arguments does not exist",
                ^{
                    SlimList* empty = SlimList_Create();
                    SlimList* args = SlimList_Create();
                    StatementExecutor* statementExecutor = StatementExecutor_Create();
                    StatementExecutor_Make(statementExecutor, "test_slim", "TestSlim", empty);
                    NSString* result = [NSString stringWithFormat: @"%s", StatementExecutor_Call(statementExecutor, "test_slim", "noSuchMethod", args)];
                    
                    [expect(result) toBeEqualTo: @"__EXCEPTION__:message:<<NO_METHOD_IN_CLASS noSuchMethod[0] TestSlim.>>"];
                }),
             it(@"returns an error if calling a method with one agument, but it takes none",
                ^{
                    SlimList* empty = SlimList_Create();
                    SlimList* args = SlimList_Create();
                    SlimList_AddString(args, "first");
                    StatementExecutor* statementExecutor = StatementExecutor_Create();
                    StatementExecutor_Make(statementExecutor, "test_slim", "TestSlim", empty);
                    StatementExecutor_Call(statementExecutor, "test_slim", "withStringArg", args);
                    
                    NSString* result = [NSString stringWithFormat: @"%s", StatementExecutor_Call(statementExecutor, "test_slim", "noSuchMethod", args)];
                    [expect(result) toBeEqualTo: @"__EXCEPTION__:message:<<NO_METHOD_IN_CLASS noSuchMethod[1] TestSlim.>>"];
                }),
             it(@"calls a function with a string argument",
                ^{
                    SlimList* empty = SlimList_Create();
                    SlimList* args = SlimList_Create();
                    SlimList_AddString(args, "put the toilet seat down");
                    StatementExecutor* statementExecutor = StatementExecutor_Create();
                    StatementExecutor_Make(statementExecutor, "test_slim", "TestSlim", empty);
                    StatementExecutor_Call(statementExecutor, "test_slim", "withStringArg", args);
                    
                    TestSlim* test_slim_instance = (TestSlim*)StatementExecutor_Instance(statementExecutor, "test_slim");
                    [expect(test_slim_instance.calledWithStringArg) toBeEqualTo:@"put the toilet seat down"];
                }),
             it(@"returns an error if the function with one argument does not exist",
                ^{
                    SlimList* empty = SlimList_Create();
                    SlimList* args = SlimList_Create();
                    SlimList_AddString(args, "put the toilet seat down");
                    StatementExecutor* statementExecutor = StatementExecutor_Create();
                    StatementExecutor_Make(statementExecutor, "test_slim", "TestSlim", empty);
                    NSString* result = [NSString stringWithFormat: @"%s", StatementExecutor_Call(statementExecutor, "test_slim", "noOtherSuchMethod", args)];
                    
                    [expect(result) toBeEqualTo: @"__EXCEPTION__:message:<<NO_METHOD_IN_CLASS noOtherSuchMethod[1] TestSlim.>>"];
                }),
             it(@"calls a method with null if no arguments are given, but it takes one",
                ^{
                    SlimList* empty = SlimList_Create();
                    SlimList* args = SlimList_Create();
                    StatementExecutor* statementExecutor = StatementExecutor_Create();
                    StatementExecutor_Make(statementExecutor, "test_slim", "TestSlim", empty);
                    StatementExecutor_Call(statementExecutor, "test_slim", "withStringArg", args);
                    
                    TestSlim* test_slim_instance = (TestSlim*)StatementExecutor_Instance(statementExecutor, "test_slim");
                    expectTruth(test_slim_instance.calledWithStringArg == NULL);
                }),
             it(@"calls a function with two string arguments",
                ^{
                    SlimList* empty = SlimList_Create();
                    SlimList* args = SlimList_Create();
                    SlimList_AddString(args, "put the toilet seat down");
                    SlimList_AddString(args, "every time");
                    StatementExecutor* statementExecutor = StatementExecutor_Create();
                    StatementExecutor_Make(statementExecutor, "test_slim", "TestSlim", empty);
                    StatementExecutor_Call(statementExecutor, "test_slim", "withMultipleArgs", args);
                    
                    TestSlim* test_slim_instance = (TestSlim*)StatementExecutor_Instance(statementExecutor, "test_slim");
                    [expect(test_slim_instance.calledWithFirstStringArg) toBeEqualTo:@"put the toilet seat down"];
                    [expect(test_slim_instance.calledWithSecondStringArg) toBeEqualTo:@"every time"];
                }),
             nil);
}