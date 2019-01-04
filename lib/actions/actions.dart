import 'package:flutter_redux_boilerplate/models/repo.dart';
import 'package:meta/meta.dart';

class QueryChangedAction {
  final String query;

  QueryChangedAction({
    @required this.query,
  });
}

class GithubLoadSuccessAction {
  final List<Repo> repos;

  GithubLoadSuccessAction({
    @required this.repos,
  });
}

class GithubLoadFailureAction {
  final String error;

  GithubLoadFailureAction({
    @required this.error,
  });
}