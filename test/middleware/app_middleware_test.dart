import 'package:flutter_redux_boilerplate/actions/actions.dart';
import 'package:flutter_redux_boilerplate/middleware/app_middleware.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/models/github_repo_result.dart';
import 'package:flutter_redux_boilerplate/models/owner_details_result.dart';
import 'package:flutter_redux_boilerplate/models/repo.dart';
import 'package:flutter_redux_boilerplate/services/github_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux_boilerplate/reducers/app_reducer.dart';
import 'package:mockito/mockito.dart';

import '../mocks.dart';

void main() {
  group('The middleware', () {
    AppMiddleware uut;
    Store<AppState> store;

    GithubRepository mockGithubRepository;

    setUp(() {
      mockGithubRepository = MockGithubRepository();

      uut = AppMiddleware(
        repository: mockGithubRepository,
      );

      store = Store<AppState>(
        appReducer,
        initialState: AppState.initial(),
        middleware: uut.createMiddleware(),
      );
    });

    group('when QueryChangedAction', () {
      final givenQuery = 'some query';

      test('should have the default state', () {
        expect(store.state.repoState.data.totalCount, 0);
        expect(store.state.repoState.data.items, []);
        expect(store.state.repoState.error, null);
      });

      group('and the repository request throws an exception', () {
        Exception givenException = Exception();

        setUp(() {
          when(mockGithubRepository.loadRepoResult(givenQuery))
              .thenThrow(givenException);

          store.dispatch(QueryChangedAction(query: givenQuery));
        });

        test('should set the error', () {
          expect(store.state.repoState.error, givenException.toString());
        });
      });

      group('and the repository request succeeds without issue', () {
        GithubRepoResult givenResult = GithubRepoResult(
          totalCount: 120,
          items: <Repo>[
            Repo(
              name: 'some name',
              stars: 120,
            ),
          ],
        );

        setUp(() {
          when(mockGithubRepository.loadRepoResult(givenQuery))
              .thenAnswer((_) => Future.value(givenResult));

          store.dispatch(QueryChangedAction(query: givenQuery));
        });

        test('should set the data', () {
          expect(store.state.repoState.data, givenResult);
        });
      });
    });

    group('when LoadOwnerDetailsAction', () {
      final givenOwner = 'some owner';

      test('should have the default state', () {
        expect(store.state.ownerDetailsState.data.login, null);
        expect(store.state.ownerDetailsState.data.name, null);
        expect(store.state.ownerDetailsState.data.location, null);
        expect(store.state.ownerDetailsState.data.publicRepos, null);
        expect(store.state.ownerDetailsState.data.followers, null);
        expect(store.state.ownerDetailsState.data.following, null);
      });

      group('and the repository request throws an exception', () {
        Exception givenException = Exception();

        setUp(() {
          when(mockGithubRepository.loadOwnerDetails(givenOwner))
              .thenThrow(givenException);

          store.dispatch(LoadOwnerDetailsAction(owner: givenOwner));
        });

        test('should set the error', () {
          expect(store.state.ownerDetailsState.error, givenException.toString());
        });
      });

      group('and the repository request succeeds without issue', () {
        OwnerDetailsResult givenResult = OwnerDetailsResult(
          login: 'some login',
          name: 'some name',
          publicRepos: 1,
          followers: 2,
          following: 3,
        );

        setUp(() {
          when(mockGithubRepository.loadOwnerDetails(givenOwner))
              .thenAnswer((_) => Future.value(givenResult));

          store.dispatch(LoadOwnerDetailsAction(owner: givenOwner));
        });

        test('should set the data', () {
          expect(store.state.ownerDetailsState.data, givenResult);
        });
      });
    });
  });
}
