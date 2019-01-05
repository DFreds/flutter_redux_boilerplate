# Flutter Redux Boilerplate

A Flutter boilerplate application with Redux.

## Motivation

I wasn't happy with the other Flutter Redux boilerplates as I found they included too many optional
libraries. This boilerplate contains only the most basic libraries required to implement Redux in a
Flutter application while still showcasing how to do all the necessary Redux patterns.

The two main libraries are listed below.

* [redux.dart](https://pub.dartlang.org/packages/redux)
* [flutter_redux.dart](https://pub.dartlang.org/packages/flutter_redux)

Read about the basics of Redux [here](https://github.com/johnpryan/redux.dart/blob/master/doc/basics.md).

## App Structure

The app is structured with the following directories:

### actions

This includes any Redux actions that the user or middleware dispatches. This can either be one or
many files depending on your personal style.

### components

Components are widgets which are not connected to the Redux store and therefore cannot directly
access the application state or dispatch any actions via the store. This is where you put your
standard Flutter widgets. Please note that it is often necessary that they are stateful widgets in
order to keep track of their local state. Additionally, these are different than screens in that
they are not meant to be navigated to directly via the navigator.

### containers

Containers are widgets that ARE connected to the Redux store and therefore can utilize both the
application state and modify it through actions. The store is provided via the `StoreConnector`
widget which requires both a converter and builder property. While converters can return any data
object desired, I chose to demonstrate the converters via the inner private `_ViewModel` class as I
found this methodology requires the least amount of refactoring when the connection to the store
needs to change.

### middleware

Middleware are functions that allow Redux to run asynchronous code and dispatch new actions when
the async functions complete. Each middleware must be provided to the store when the store is
created. An example is provided with `app_middleware.dart`, which utilizes the `TypedMiddleware`
helper to map specific actions to specific middleware methods. However, this is just my
recommended way of doing it, and there is nothing stopping you from implementing your reducers with
simple `switch` or `if` statements. Read more about middleware
[here](https://github.com/johnpryan/redux.dart/blob/master/doc/async.md).

### models

Models hold all data objects utilized throughout the application. This includes the Redux state
objects as well as simple data classes. The `app_state.dart` file defines the main state of the
store and uses substate objects such as `repo_state.dart` to help organize the state of the app.

### reducers

Reducers are the functions that take an input action and output a new state. The application requires
one main reducer (`app_reducer.dart`), but each aspect of the main app state should utilize its own
reducer. An example is provided with `repo_reducer.dart`, which utilizes the `combineReducers` and
`TypedReducer` helper to map specific actions to specific reduction methods. However, this is just my
recommended way of doing it, and there is nothing stopping you from implementing your reducers with
simple `switch` or `if` statements. Read more about the helpers
[here](https://github.com/johnpryan/redux.dart/blob/master/doc/combine_reducers.md).

### screens

Screens are widgets that compose other widgets in order to display a full screen in an application.
These are the widgets that get navigated to via the `Navigator` and are referenced in the routes.

### selectors

Selectors are functions that accept Redux state and return some data off of it. They can be simple
n that they only return a property off the state or more complex, such as doing functional
transformations on a list (i.e. filter or map). Selectors help to avoid duplicate data in Redux
across components as well as reducing the coupling between the state and the components.

### services

This is an optional folder that contains any other business logic that is independent of a widget.
It is a good location to put your API functions or other services. However, it is not required for
a Redux implementation.

### store

Store only has one file (`store.dart`) which is used to create the store. Stores in
Flutter Redux accept the main app reducer, the initial state, and an array of middleware utilized
throughout the app. It also optionally allows identical states to be ignored via the `distinct`
property.

### main.dart and redux_app.dart

`main.dart` is the entry point to the application. It creates the store and passes it to `ReduxApp`.
`ReduxApp` sets up the `StoreProvider`, which allows container widgets to access the store via
`StoreConnector`.

## Helpers

### Other Useful Libraries

These libraries can be useful to further mature your Redux implementation, but they are not required
and were not included in this boilerplate.

* [redux_thunk.dart](https://pub.dartlang.org/packages/redux_thunk)
* [redux_logging.dart](https://pub.dartlang.org/packages/redux_logging)
* [redux_persist.dart](https://pub.dartlang.org/packages/redux_persist)
* [redux_persist_flutter.dart](https://pub.dartlang.org/packages/redux_persist_flutter)
* [flutter_redux_dev_tools.dart](https://pub.dartlang.org/packages/flutter_redux_dev_tools)

### VSCode Redux Widget Snippet

The following VSCode snippet can be utilized to quickly create a new Redux container widget. To use
it, just type `fredux` and hit enter. Note that this will not compile until you import your own
version of `AppState`.

```json
{
  "Flutter redux": {
    "prefix": "fredux",
    "body": [
      "import 'package:flutter/material.dart';",
      "import 'package:flutter_redux/flutter_redux.dart';",
      "import 'package:redux/redux.dart';",
      "",
      "class $0 extends StatelessWidget {",
      "  @override",
      "  Widget build(BuildContext context) {",
      "    return StoreConnector<AppState, _ViewModel>(",
      "      distinct: true,",
      "      converter: (store) => _ViewModel.fromStore(store),",
      "      builder: (BuildContext context, _ViewModel viewModel) {",
      "        return Container();",
      "      },",
      "    );",
      "  }",
      "}",
      "",
      "class _ViewModel {",
      "  _ViewModel();",
      "",
      "  static _ViewModel fromStore(Store<AppState> store) {",
      "    return _ViewModel();",
      "  }",
      "}"
    ]
  }
}

```

## Other TODOs

* Write some tests
* Do some pagination of the github data
* Showcase some navigation as part of state