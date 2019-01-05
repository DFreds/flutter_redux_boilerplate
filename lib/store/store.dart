import 'package:flutter_redux_boilerplate/middleware/app_middleware.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/reducers/app_reducer.dart';
import 'package:redux/redux.dart';

Store<AppState> createStore() {
  return Store(
    appReducer,
    initialState: AppState.initial(),
    distinct: true,
    middleware: AppMiddleware().createMiddleware(), 
  );
}
