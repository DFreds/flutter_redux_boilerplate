import 'package:flutter_redux_boilerplate/actions/actions.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/models/repo.dart';
import 'package:flutter_redux_boilerplate/services/github_web_client.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createMiddleware() => <Middleware<AppState>>[
  TypedMiddleware<AppState, dynamic>(_logAction),
  TypedMiddleware<AppState, QueryChangedAction>(_searchGithub),
];

void _logAction(Store<AppState> store, dynamic action, NextDispatcher next) async {
  next(action);

  print(action);
}

void _searchGithub(Store<AppState> store, QueryChangedAction action, NextDispatcher next) async {
  next(action);

  try {
    final List<Repo> repos = await GithubWebClient.fetchRepos(action.query);
    store.dispatch(GithubLoadSuccessAction(data: repos));
  } catch (e) {
    store.dispatch(GithubLoadFailureAction(error: e.toString()));
  }
}