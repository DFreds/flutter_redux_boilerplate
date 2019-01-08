import 'package:flutter_redux_boilerplate/models/nav_state.dart';
import 'package:flutter_redux_boilerplate/models/owner_details_state.dart';
import 'package:flutter_redux_boilerplate/models/repo_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final NavState navState;
  final RepoState repoState;
  final OwnerDetailsState ownerDetailsState;

  AppState({
    @required this.navState,
    @required this.repoState,
    @required this.ownerDetailsState,
  });

  factory AppState.initial() {
    return AppState(
      navState: NavState.initial(),
      repoState: RepoState.initial(),
      ownerDetailsState: OwnerDetailsState.initial(),
    );
  }

  // TODO hash code and equals
}