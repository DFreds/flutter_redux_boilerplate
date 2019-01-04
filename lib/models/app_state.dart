import 'package:flutter_redux_boilerplate/models/repo_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final RepoState repoState;

  AppState({
    @required this.repoState,
  });

  factory AppState.initial() {
    return AppState(
      repoState: RepoState.initial(),
    );
  }

  // TODO hash code and equals
}