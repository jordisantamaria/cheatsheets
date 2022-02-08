# Basic concepts

```
// Define a function.
void printInteger(int aNumber) {
  print('The number is $aNumber.'); // Print to console.
}

// This is where the app starts executing.
void main(List<String> arguments) {
  var number = 42; // Declare and initialize a variable.
  printInteger(number); // Call a function.
}
```
## Variables

Everything is an object, functions, primitives also.

Variables starting with _ are private.

```
var hello = 'helloWord';
final minAge = 18;               // constante
const pi = 3.4                   // constante en tiempo de compilacion, nose cuando usarlo
```


### Null safety

Null safety is available in Dart 2.12 and Flutter 2.

```
int? halogens;               // To be nullabe
halogens!.add('fluorine');   // To avoid error in nullable elements.
late String description;     // To avoid problems in typechecking if giving value after.
```

## Types

```
int          // No decimals
double       // With decimals
num          // Can be int or double
String
bool
List<int>
Set          // No repeated values list
Map          // json object
enum Color { red, green, blue }
```

### Type test operators

```
as	Typecast (also used to specify library prefixes)
is	True if the object has the specified type
is!	True if the object doesn’t have the specified type
```

## Strings

- Multi line

```
var str = """
  This is
  a
  string
"""
```

- Raw
```
var str = r"This is a raw string"
```

- Using variables in strings

```
var str = "Hello $user"
var str = "Hello ${user}"
```

## Collections

We can use If and for to create a collection

```
var nav = [
  'Home',
  'Furniture',
  'Plants',
  if (promoActive) 'Outlet'
];

var listOfInts = [1, 2, 3];
var listOfStrings = [
  '#0',
  for (var i in listOfInts) '#$i'
];
```

- Operations

```
elements.add('hello')
elements.addAll(list)
elements.length
elements = [1, ...elements]
```

## Functions

All functions return values, If nothing is specified, return null.

```
bool isNoble(int atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}
```

- Arrow Function

```
bool isNoble(int atomicNumber) => _nobleGases[atomicNumber] != null;
```

### Function parameters

- Optional positional parameter

```
getHttpUrl(String server, String path, [int port=80, int numRetries=3]) {
  // ...
}

getHttpUrl('example.com', '/index.html');
getHttpUrl('example.com', '/index.html', 8080);
getHttpUrl('example.com', '/index.html', 8080, 5);
```

- Optional named parameter

```
getHttpUrl(String server, String path, {int port = 80, int numRetries = 3}) {
  // ...
}

getHttpUrl('example.com', '/index.html');
getHttpUrl('example.com', '/index.html', port: 8080);
getHttpUrl('example.com', '/index.html', port: 8080, numRetries: 5);
getHttpUrl('example.com', '/index.html', numRetries: 5, port: 8080);
getHttpUrl('example.com', '/index.html', numRetries: 5);
```

# Cascade Notation

```
var paint = Paint()
  ..color = Colors.black
  ..strokeCap = StrokeCap.round
  ..strokeWidth = 5.0;

=

var paint = Paint();
paint.color = Colors.black;
paint.strokeCap = StrokeCap.round;
paint.strokeWidth = 5.0;
```

- With null check

```
querySelector('#confirm') // Get an object.
  ?..text = 'Confirm' // Use its members.
  ..classes.add('important')
  ..onClick.listen((e) => window.alert('Confirmed!'));

=

var button = querySelector('#confirm');
button?.text = 'Confirm';
button?.classes.add('important');
button?.onClick.listen((e) => window.alert('Confirmed!'));
```

- Nested cascade

```
final addressBook = (AddressBookBuilder()
      ..name = 'jenny'
      ..email = 'jenny@example.com'
      ..phone = (PhoneNumberBuilder()
            ..number = '415-555-0100'
            ..label = 'home')
          .build())
    .build();
```

# Classes

## Creating class

```
class Point {
  double x = 0;
  double y = 0;

  // Syntactic sugar for setting x and y
  // before the constructor body runs.
  Point(this.x, this.y);
}

=

class Point {
  double x = 0;
  double y = 0;

  Point(double x, double y) {
    // There's a better way to do this, stay tuned.
    this.x = x;
    this.y = y;
  }
}
```

- Named Constructor

```
class Person {
  String? firstName;

  Person.fromJson(Map data) {
    print('in Person');
  }
}

var employee = Person.fromJson({});
```

## Using class

```
var p = Point(2, 2);

p.y = 5;

// Invoke distanceTo() on p.
double distance = p.distanceTo(Point(4, 4));
```


# Async await

```
Future<void> checkVersion() async {
  var version = await lookUpVersion();
  // Do something with version
}
```


# Flutter

```
lib/main.dart => dart code creating app
pubspec.yaml => dependencies
```

- Execute dependencies

```
Inside pubspec.yaml click in pub get
It autogenerates pubspec.lock
```

## Widgets

2 tipos, stateless que no cambia y stateful que cambia.

To use icons, include in pubscpec.yaml this lines

```
name: my_app
flutter:
  uses-material-design: true   // NEW
```

And wrapped in widget MaterialApp

### Layout

- Text

- Row, Column

- Stack: for position absolute elements.

- Container: padding, margins, borders, or background color, to name some of its capabilities.

- Expanded: To use all possible space. Use flex to define how much % of space to use.

- Scaffold: Layout with appBar and body.

- AppBar

- GestureDetector: To include event on a widget.

- ElevatedButton

- GridView

- ListView

- Card

- ListTile: Include title, subtitle and leading, used in cards.


## State

1. Ephemeral state: stateful widget.
2. App state: state shared between different parts of app and user serssions.


# Dart blocs

- BlocProvider: Initialize bloc to be accessible by dependency injection in Its tree.

To get access to bloc initialize by bloc provider use context.read
```
context.read<LoadingCubit>().hideLoading()
```

- BlocBuilder: To give access to a bloc state to Its tree, bloc have to be initialized before with blocprovider.
- BlocListener: To listen in changes of bloc state.

