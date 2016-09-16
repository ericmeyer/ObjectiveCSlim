# Using Objective C Slim

[![Build Status](https://travis-ci.org/ericmeyer/ObjectiveCSlim.svg?branch=master)](https://travis-ci.org/ericmeyer/ObjectiveCSlim)

## See here for installation/setup instructions: https://github.com/ericmeyer/OCSlim-Templates

# What is Objective C Slim?

This provides a way to write acceptance tests for your iOS and other Objective C applications using Slim tables and fixtures written in Objective C.

http://fitnesse.org/FitNesse.UserGuide.SliM has more information about what Slim is.

# Making Changes to Objective C Slim

https://github.com/dougbradbury/cslim

This project is an example project using the cslim project as a dependency via a git submodule.  If you make changes/additions to Objective C Slim, make sure to push those to the cslim project.  Also, new files should typically be added to the cslim submodule.

# Running These Examples

Note: Some of the examples intentionally give errors or warnings.

1. Clone this project.
2. Run `git submodule init`
3. Run `git submodule update`
4. Open the project in Xcode.
5. Run `./bin/StartFitnesse`
6. Open a browser to http://localhost:8080/CslimFirstExamples
7. Click "Suite" near the top left corner.
8. See results.

# Getting Started with Tests for Xcode

Soon to be replaced with a template for an acceptance test target.

1. Create a new project or open an existing project
2. Checkout https://github.com/dougbradbury/cslim into your project.
3. Create a new target and call it AcceptanceTests.
4. Add all the header files from the following directories to the project.  Make sure they are a included in the AcceptanceTests target.
  * include/Com
  * include/CSlim
5. Add all the src files from the following directories to the project.  Make sure they are a included in the AcceptanceTests target.
  * src/Com
  * src/CSlim
  * src/ExecutorObjectiveC
6. Download fitnesse.jar into the root of your project.
7. Start fitnesse and write some tests.  See http://fitnesse.org/FitNesse.UserGuide.SliM for help in writing and running Slim tests.
8. Write new fixtures in Xcode, making sure to add them to the AcceptanceTests target.
9. Run the tests in fitnesse.

Currently, the target AcceptanceTests will not actually run the tests.  Instead it just builds the fixtures.

## Fitnesse Test Runner Options

Use this as a starting point for the contents of your Fitnesse page that is your top level suite.  It has been copy pasted from http://localhost:8080/CslimFirstExamples?edit while fitnesse is running on your local machine.

<pre>
!contents -R2 -g -p -f -h


!define TEST_SYSTEM {slim}
!define TEST_RUNNER {build/Debug/AcceptanceTests.app/Contents/MacOS/AcceptanceTests}
!define COMMAND_PATTERN {%m}
!define SLIM_VERSION {0.0}
</pre>

## Writing Fixtures

Fixture methods that take one argument expect an NSString
Fixture methods that take more than one argument expect an NSArray of NSString's.
All fixture methods return an NSString
See ObjAdderFixture for an example of a decision table
See Count for an example of a script table

## Useful Methods

Converting Strings to number primitives:

* [@"123" intValue];
* [@"3.50" doubleValue];
* [@"3.14" floatValue];


Converting to an NSString

* From an NSNumber
  * NSNumber* number = [NSNumber numberWithInt: 1];
  * [number stringValue];
* General case
  * [NSString stringWithFormat: @"%@, %@", @"Lastname", @"Firstname"];