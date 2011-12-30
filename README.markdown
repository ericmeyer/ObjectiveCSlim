# Making Changes to Objective C Slim

https://github.com/dougbradbury/cslim

This project is an example project using the cslim project as a dependency via a git submodule.  If you make changes/additions to Objective C Slim, make sure to make those in the cslim project.

# Running These Examples

Note: Some of the examples intentionally give errors.

1. Clone this project.
2. Run `git submodule init`
3. Run `git submodule update`
4. Open the project in Xcode.
5. Build the AcceptanceTests target.
6. Run `./bin/start_fitnesse`
7. Open a browser to http://localhost:8080/CslimFirstExamples
8. Click "Suite" near the top left corner.
9. See results.

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
6. Start fitnesse and write some tests.  See http://fitnesse.org/FitNesse.UserGuide.SliM for help in writing and running Slim tests.
7. Write new fixtures in Xcode, making sure to add them to the AcceptanceTests target.
8. Run the tests in fitnesse.

Currently, the target AcceptanceTests will not actually run the tests.  Instead it just builds the fixtures.