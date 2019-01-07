import 'package:flutter_redux_boilerplate/models/github_repo_result.dart';
import 'package:meta/meta.dart';

@immutable
class RepoState {
  final bool isLoading;
  final int currentPage;
  final String query;
  final GithubRepoResult data;
  final String error;

  RepoState({
    @required this.isLoading,
    @required this.currentPage,
    @required this.query,
    @required this.data,
    @required this.error,
  });

  factory RepoState.initial() {
    return RepoState(
      isLoading: false,
      currentPage: 1,
      query: '',
      data: GithubRepoResult.initial(),
      error: null,
    );
  }

  RepoState copyWith({
    bool isLoading,
    int currentPage,
    String query,
    GithubRepoResult data,
    String error,
  }) {
    return RepoState(
      isLoading: isLoading ?? this.isLoading,
      currentPage: currentPage ?? this.currentPage,
      query: query ?? this.query,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  // TODO hash code and equals
}
