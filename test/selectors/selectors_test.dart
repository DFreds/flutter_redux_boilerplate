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

    group('when repoStateSelector', () {
      RepoState result;

      setUp(() {
        result = repoStateSelector(store.state);
      });

      test('should return the repo state', () {
        expect(result == null, false);
      });
    });
  });
}
