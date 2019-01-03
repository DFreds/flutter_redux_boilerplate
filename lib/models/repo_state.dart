import 'package:flutter_redux_boilerplate/models/repo.dart';
import 'package:meta/meta.dart';

@immutable
class RepoState {
  final bool isLoading;
  final String query;
  final bool isError;
  final List<Repo> repos;

  RepoState({
    @required this.isLoading, 
    @required this.query,
    @required this.isError,
    @required this.repos,
  });

  factory RepoState.initial() {
    return RepoState(
      isLoading: false,
      query: '',
      isError: false,
      repos: [],
    );
  }

  RepoState copyWith({
    bool isLoading,
    String query,
    bool isError,
    List<Repo> repos,
  }) {
    return RepoState(
      isLoading: isLoading ?? this.isLoading,
      query: query ?? this.query,
      isError: isError ?? this.isError,
      repos: repos ?? this.repos,
    );
  }

  // TODO hash code and equals
}