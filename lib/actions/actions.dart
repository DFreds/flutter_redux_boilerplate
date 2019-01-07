import 'package:flutter_redux_boilerplate/models/repo.dart';
import 'package:meta/meta.dart';

class ChangeBottomNavAction {
  final int index;

  ChangeBottomNavAction({
    @required this.index,
  });
}

class QueryChangedAction {
  final String query;

  QueryChangedAction({
    @required this.query,
  });
}

class GithubLoadSuccessAction {
  final List<Repo> data;

  GithubLoadSuccessAction({
    @required this.data,
  });
}

class GithubLoadFailureAction {
  final String error;

  GithubLoadFailureAction({
    @required this.error,
  });
}