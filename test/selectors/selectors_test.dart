import 'package:flutter/material.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/models/repo_state.dart';
import 'package:flutter_redux_boilerplate/selectors/selectors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux_boilerplate/reducers/app_reducer.dart';

void main() {
  group('The Selectors', () {
    Store<AppState> store;

    setUp(() {
      store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
      );
    });

    group('when rootScreenSelector', () {
      Widget result;

      setUp(() {
        result = rootScreenSelector(store.state);
      });

      test('should return the root screen', () {
        expect(result == null, false);
      });
    });

    group('when selectedBottomNavSelector', () {
      int result;

      setUp(() {
        result = selectedBottomNavSelector(store.state);
      });

      test('should return the selected bottom navigation index', () {
        expect(result, 0);
      });
    });

    group('when repoStateSelector', () {
      RepoState result;

      setUp(() {
        result = repoStateSelector(store.state);
      });

      test('should return the repo state', () {
        expect(result == null, false);
      });
    });

    group('when totalResultsSelector', () {
      int result;

      setUp(() {
        result = totalResultsSelector(store.state);
      });

      test('should return the total results', () {
        expect(result, 0);
      });
    });
  });
}
