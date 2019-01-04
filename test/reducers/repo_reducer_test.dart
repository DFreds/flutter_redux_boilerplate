import 'package:flutter_redux_boilerplate/actions/actions.dart';
import 'package:flutter_redux_boilerplate/models/repo.dart';
import 'package:flutter_redux_boilerplate/models/repo_state.dart';
import 'package:flutter_redux_boilerplate/reducers/repo_reducer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import '../test_helpers.dart';

void main() {
  group('The repoReducer', () {
    Reducer<RepoState> uut;
    Store<RepoState> store;

    setUp(() {
      uut = repoReducer;

      store = Store<RepoState>(
        uut,
        initialState: RepoState.initial(),
      );
    });

    test('should set the initial state', () {
      expect(store.state.isLoading, false);
      expect(store.state.currentPage, 1);
      expect(store.state.query, '');
      expect(store.state.data, []);
      expect(store.state.error, null);
    });

    group('when QueryChangedAction', () {
      final givenQuery = "some query";

      setUp(() {
        store.dispatch(QueryChangedAction(query: givenQuery));
      });

      test('should set loading to true', () {
        expect(store.state.isLoading, true);
      });

      test('should set query to given query', () {
        expect(store.state.query, givenQuery);
      });

      test('should set error to null', () {
        expect(store.state.error, null);
      });
    });

    group('when GithubLoadSuccessAction', () {
      final givenRepos = <Repo>[
        Repo(
          name: 'some name',
          stars: 102
        ),
      ];

      setUp(() {
        store.dispatch(GithubLoadSuccessAction(
          data: givenRepos,
        ));
      });

      test('should set loading to false', () {
        expect(store.state.isLoading, false);
      });

      test('should set data to given repos', () {
        expect(eqList(store.state.data, givenRepos), true);
      });

      test('should set error to null', () {
        expect(store.state.error, null);
      });
    });

    group('when GithubLoadFailureAction', () {
      final givenError = 'error message';

      setUp(() {
        store.dispatch(GithubLoadFailureAction(
          error: givenError,
        ));
      });

      test('should set loading to false', () {
        expect(store.state.isLoading, false);
      });

      test('should set error to given error', () {
        expect(store.state.error, givenError);
      });
    });
  });
}
