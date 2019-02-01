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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          navState == other.navState &&
          repoState == other.repoState &&
          ownerDetailsState == other.ownerDetailsState;

  @override
  int get hashCode =>
      navState.hashCode ^ repoState.hashCode ^ ownerDetailsState.hashCode;
}
