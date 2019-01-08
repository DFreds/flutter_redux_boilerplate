import 'package:flutter_redux_boilerplate/actions/actions.dart';
import 'package:flutter_redux_boilerplate/models/owner_details_result.dart';
import 'package:flutter_redux_boilerplate/models/owner_details_state.dart';
import 'package:flutter_redux_boilerplate/reducers/owner_details_reducer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

void main() {
  group('The ownerDetailsReducer', () {
    Reducer<OwnerDetailsState> uut;
    Store<OwnerDetailsState> store;

    setUp(() {
      uut = ownerDetailsReducer;

      store = Store<OwnerDetailsState>(
        uut,
        initialState: OwnerDetailsState.initial(),
      );
    });

    test('should set the initial state', () {
      expect(store.state.isLoading, false);
      expect(store.state.data.login, null);
      expect(store.state.data.name, null);
      expect(store.state.data.location, null);
      expect(store.state.data.publicRepos, null);
      expect(store.state.data.followers, null);
      expect(store.state.data.following, null);
      expect(store.state.error, null);
    });

    group('when LoadOwnerDetailsAction', () {
      final givenOwner = 'some owner';

      setUp(() {
        store.dispatch(LoadOwnerDetailsAction(owner: givenOwner));
      });

      test('should set loading to true', () {
        expect(store.state.isLoading, true);
      });

      test('should set error to null', () {
        expect(store.state.error, null);
      });
    });

    group('when OwnerDetailsLoadSuccessAction', () {
      OwnerDetailsResult givenResult = OwnerDetailsResult(
        login: 'some login',
        name: 'some name',
        location: 'some location',
        publicRepos: 0,
        followers: 1,
        following: 2,
      );

      setUp(() {
        store.dispatch(OwnerDetailsLoadSuccessAction(
          data: givenResult,
        ));
      });

      test('should set loading to false', () {
        expect(store.state.isLoading, false);
      });

      test('should set data to given result', () {
        expect(store.state.data, givenResult);
      });

      test('should set error to null', () {
        expect(store.state.error, null);
      });
    });

    group('when OwnerDetailsLoadFailureAction', () {
      final givenError = 'error message';

      setUp(() {
        store.dispatch(OwnerDetailsLoadFailureAction(
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
