# Boy scout rule

If you find a dirty code and It's possible to fix It in around 15 minutes, do It.


Names
========================================================================================

Change variable names when found a better one.
Names have to be clear and respond to the follow questions:
1. What is It's purpose
2. What It does
3. How is used

Assign always constant values to a variables to indicate It's purpose.

## Avoid confusing names

For example, don't use `accountList` as a name of a variable It's Its not a list,
instead use something like `accountGroup`, `bunchOfAccounts`, or simply accounts.

## General rules

- Use names that can be pronounced and able to search

- The size of a name have to be related to It's ambit.

- Avoid include the type of the variable in It's name, IDE already gives you this info.

- Avoid prefixes in variables like `m_disc`

## Interface and implementation

Don't use prefix in interfaces, use It in implementation to separate names.
`interface ShapeFactory => implementation ShapeFactoryImp`

## Class names

- Name of a class must **not be a verb**.
- Names should be very specific, since class should do only 1 thing, so avoid names
    like Manager, Procesor, Info, etc..

## Method names

Method names **are verbs**, use prefixes like `get`, `set` and `is`

## Use 1 word for every concept.

It's confuse to have names means the same like `fetch`, `retrieve`, `get` in the
same source code.

## Don't use the same name for multiple concepts

For example, don't use `add` for increase a number and `add` for insert in a list.
Use different names.

## Use names related to the domain.

Use the concepts programmers are already familiar with It, for example, a variable
related to a VISITOR pattern, It's better a name like `AccountVisitor` than `JobQueue`

## Include context to the names

Instead of use prefixes for the name, try as much as possible wrap It into a class
representing the value of It's prefix. Instead of use `addrFirstName, addrLastName`,
create an `Address` class.

## Don't include context If It's not required

If we use a prefix for the application names for example to start all with `App`,
It will be difficult to find the name in the IDE.


Functions
========================================================================================

When you write functions, you should write It like you were telling an story.

## Reduced size

- Functions should be max 20 lines length, but as reduced size as possible.

- Functions should tell a story and be organized, so every function turns
  you to the next step.

## Blocks and indentation

- Every if else while should only have 1 line calling a function.

- The indentation size of a function shouldn't be bigger than 2.

## Do only 1 thing

**Functions must only do one thing, do It properly and only do that.**

- If the function only do 1 step behind the function name, It does 1 thing.

- If a function have sections, It does more than 1 thing.

- A function only must have 1 level of abstraction, for example `getHtml()`,
  returns the  raw html, don't parse It.

## Read code from top to bottom

After read a function, we want the next function to be the next level of
abstraction of the parent function, to be able to read the code from top to
bottom like a book.

## Switch instructions

A switch instruction means It does multiple things so It must be avoid.
It can be tolerated If there is only 1 switch in all the program.

## Function arguments

Ideal is 0 arguments. As possible max 2 arguments, more arguments have to be justified.
If requires more arguments, probably those arguments can be group into an object.

## Avoid state arguments

If a function receive a boolean argument, It automatically does more than 1 thing.

## Naming a function with arguments

A function with argument should be a tuple of verb and substantive,
also the name should explain what arguments It receive. Ex: `writeField(name)`,

## Without secondary effects

- It should only do what function name describes.

- avoid output arguments, since It's a secondary effect.

- A function should do something or respond to something, not both.
  Ex: `public boolean set(String attribute, value)` check something,
  set a value and return boolean, It should only set a value.

## Use try catch instead of return error codes

- To check an error, a try catch should be used.

- The body of a try catch should be calls to other functions.

- Process errors is 1 thing, so the body of a function with try catch, only
  should be the try catch.
    ```
    public void delete(Page page) {
      try {
        deletePageAndAllReferences(page);
      }  catch (Exception e) {
        logError(e)
      }
    }
    ```

## Don't repeat yourself

Duplicated code becomes more difficult to maintain, because 1 change means change
in multiple spaces.

## How to write functions

First you write the functionality and the test in a dirty functions, then when
everything works, It comes the time to refactoring the code.


Comments
========================================================================================

- Don't comment an incorrect code, rewrite It.

- We use comments to compensate our incapacity to explain It by the code itself.

- We should avoid comments as much as possible, because they lie, It happens because
  when the code is updated, a lot of times comment is forgotten to be updated.
  The only source of truth is the code.

Example of a correct informative commentary

```
// format should coincide with kk:mm:ss EEE, MMM, dd, yyy
Pattern timeMatcher = Pattern.compile( "\\d*:\\d*:\\d* \\w*, \\w* \\d*, \\d*" );
```

# Formating

- The file name should be enough to explain what that file does.

- Separate sections like imports, to body, between functions, etc.. with empty line

- Keep related functionality close, same when declaring variables.

- But a class variable should be in top

- The call of a function should be used before the declaration of the function,
  so first we read the most important, later we read less important things.


Objects and data structuring
========================================================================================

## Abstracting data

To be able to give a flexible solution in the code, we should use interfaces
instead of the class. So for example, Point can be in Cartesian cords or not,
depending of the interface used.

```
public interface Point {
  double getX();
  double getY();
  void setCartesian(double x, double y);
  double getR();
}
```

## Avoid returning null

If we don't have a value, better put some default value, It will save us from checking null everywhere.

## Learning external library by writing testing code

- We first define what functionality we want from that library, then create
  test blocks for every functionality, so we just read the documentation to
  write those tests.

- With that, we can check library is working as expected and anyone can read the
  tests, to understand how is the library working.


Unit testing
========================================================================================

1. Write tests.
2. Write functionality.
3. Refactoring the code.

Unit testing is what makes the code flexible to changes, so If you do changes in
the code, you can be sure It still works. So unit testing is the key to keep a
clean code and a nice architecture.

## Clean test

A test must be easy to read, same as code.
**Build-Operate-Check** pattern:
- Build input data
- Do an operation
- Check if operation works
```
public void testGetDataAsXml() throws Exception {
  makePageWithContent("TestPageOne", "test page");

  submitRequest("TestPageOne", "type:data");

  assertResponseIsXML();
  assertResponseContains("test page", "<Tst");
}
```

So we create an API for test the code with utilities.

## One assert per test.

Every test should have one assert, or at least as minimal as possible.
It's better to repeat the functionality, so every test just check 1 thing.
Tests should also use the **given-when-then** convention.
```
public void testGetPageHierarchyAsXml() throws Exception {
  givenPages("PageOne", "PageOne.ChildOne", "PageTwo");

  whenRequestIsIssued("root", "type:pages");

  thenResponseShouldBeXML();
}

public void testGetPageHierarchyHasRightTags() throws Exception {
  givenPages("PageOne", "PageOne.ChildOne", "PageTwo");

  whenRequestIsIssued("root", "type:pages");

  thenResponseShouldContain(
    "<name>PageOne</name>", "<name>PageTwo</name>", "<name>ChildOne</name>"
  );
}
```

## F.I.R.S.T.

Clean tests follow this five rules:

1. **Fast**: Test should run quickly. If test is slow, you will not run them frequently.

2. **Independent**: Test should not depend on each other. When test depend on
   each other, then the first one to fail causes a cascade of downstream failures,
   so you don't know where Is failing.

3. **Repeatable**: Test should be repeatable in any environment.

4. **Self-validating**: Test should have a boolean output, pass or fail.

5. **Timely**: Test should be written before write the production code. If you
   write tests after production code, then you may find the production code to
   be hard to test.


Classes
========================================================================================

## Should be small

A class should have only 1 responsibility.

## High cohesion

- Class should have small number of class variables.
- class variables should be use as much as possible in It's own class methods.
- If a class lose cohesion, split that methods which are using those extra class
    variables into a new class.

## Open-Closed Principle (OCP)

- A class should be open for extension but closed for modification.
- We get this, not depending of implementation, depending of interfaces instead.
- With this, you avoid using a lot of If checking every use case.

## Dependency Inversion Principle (DCP)

Our classes should depend upon abstraction, not on concrete details. So instead
of use class as variables of a class, we use interfaces.

## Separation of main

- **Inversion of Control**:  In the initialization process, we should build up all
    the dependency of the program.
- **Dependency Injection**: Class should not take responsibility for instantiating
    dependencies itself. Inversion of control takes this responsibility.


EMERGENCE
========================================================================================

## Getting clean via emergent design

A design is "simple" if It follows these rules in order of importance:
- Runs all the tests
- Contains no duplication
- Expresses the intent of the programmer
- Minimizes the number of classes and methods

## Avoid duplication with Template Method pattern

When code is almost the same, but partial of code changes, we can create an
abstract "BASE" class with the common functionality, then classes inherit of It.
