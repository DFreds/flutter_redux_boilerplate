import 'package:flutter_redux_boilerplate/models/github_repo_result.dart';
import 'package:flutter_redux_boilerplate/models/owner_details_result.dart';
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
  final GithubRepoResult data;

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

class LoadOwnerDetailsAction {
  final String owner;

  LoadOwnerDetailsAction({
    @required this.owner,
  });
}

class OwnerDetailsLoadSuccessAction {
  final OwnerDetailsResult data;

  OwnerDetailsLoadSuccessAction({
    @required this.data,
  });
}

class OwnerDetailsLoadFailureAction {
  final String error;

  OwnerDetailsLoadFailureAction({
    @required this.error,
  });
}