import 'package:flutter_redux_boilerplate/models/repo.dart';
import 'package:meta/meta.dart';

@immutable
class RepoState {
  final bool isLoading;
  final int currentPage;
  final String query;
  final List<Repo> data;
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
      data: [],
      error: null,
    );
  }

  RepoState copyWith({
    bool isLoading,
    int currentPage,
    String query,
    List<Repo> data,
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