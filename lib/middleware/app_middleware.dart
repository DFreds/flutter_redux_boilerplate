import 'package:flutter_redux_boilerplate/actions/actions.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/models/github_repo_result.dart';
import 'package:flutter_redux_boilerplate/models/owner_details_result.dart';
import 'package:flutter_redux_boilerplate/services/github_repository.dart';
import 'package:redux/redux.dart';

class AppMiddleware {
  final GithubRepository repository;

  const AppMiddleware({
    this.repository = const GithubRepository(),
  });

  List<Middleware<AppState>> createMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, dynamic>(_logAction),
      TypedMiddleware<AppState, QueryChangedAction>(_searchGithub),
      TypedMiddleware<AppState, LoadOwnerDetailsAction>(_loadOwnerData),
    ];
  }

  void _logAction(
      Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);

    print(action);
  }

  void _searchGithub(Store<AppState> store, QueryChangedAction action,
      NextDispatcher next) async {
    next(action);

    try {
      final GithubRepoResult repoResult = await repository.loadRepoResult(action.query);
      store.dispatch(GithubLoadSuccessAction(data: repoResult));
    } catch (e) {
      store.dispatch(GithubLoadFailureAction(error: e.toString()));
    }
  }

  void _loadOwnerData(Store<AppState> store, LoadOwnerDetailsAction action, NextDispatcher next) async {
    next(action);

    try {
      final OwnerDetailsResult ownerDetails = await repository.loadOwnerDetails(action.owner);
      store.dispatch(OwnerDetailsLoadSuccessAction(data: ownerDetails));
    } catch (e) {
      store.dispatch(OwnerDetailsLoadFailureAction(error: e.toString()));
    }
  }
}