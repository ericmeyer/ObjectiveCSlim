#import "OCDSpec/OCDSpec.h"
#import "StatementExecutor.h"
#import "TestSlim.h"

CONTEXT(StatementExecutor)
{
    describe(@"make",
             it(@"should work",
                ^{
                    SlimList* empty = SlimList_Create();
                    StatementExecutor* statementExecutor = StatementExecutor_Create();
                    StatementExecutor_Make(statementExecutor, "test_slim", "TestSlim", empty);
                    id test_slim_instance = StatementExecutor_Instance(statementExecutor, "test_slim");

                    bool isTestSlimClass = [test_slim_instance isKindOfClass: [TestSlim class]];
                    expectTruth(isTestSlimClass);
                }),
             nil);
}