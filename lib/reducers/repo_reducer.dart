import 'package:flutter_redux_boilerplate/actions/actions.dart';
import 'package:flutter_redux_boilerplate/models/github_repo_result.dart';
import 'package:flutter_redux_boilerplate/models/repo_state.dart';
import 'package:redux/redux.dart';

Reducer<RepoState> repoReducer = combineReducers([
  TypedReducer<RepoState, QueryChangedAction>(_queryChanged),
  TypedReducer<RepoState, GithubLoadSuccessAction>(_githubLoadSuccess),
  TypedReducer<RepoState, GithubLoadFailureAction>(_githubLoadFailure),
]);

RepoState _queryChanged(RepoState state, QueryChangedAction action) {
  return state.copyWith(
    isLoading: true,
    query: action.query,
    error: null,
  );
}

RepoState _githubLoadSuccess(RepoState state, GithubLoadSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    data: action.data,
    error: null,
  );
}

RepoState _githubLoadFailure(RepoState state, GithubLoadFailureAction action) {
  return state.copyWith(
    isLoading: false,
    data: GithubRepoResult.initial(),
    error: action.error,
  );
}