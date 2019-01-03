import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/reducers/repo_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    repoState: repoReducer(state.repoState, action),
  );
}