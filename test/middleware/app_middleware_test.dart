import 'package:flutter_redux_boilerplate/actions/actions.dart';
import 'package:flutter_redux_boilerplate/middleware/app_middleware.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/models/repo.dart';
import 'package:flutter_redux_boilerplate/services/github_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux_boilerplate/reducers/app_reducer.dart';
import 'package:mockito/mockito.dart';

class MockGithubRepository extends Mock implements GithubRepository {}

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
        expect(store.state.repoState.data, []);
        expect(store.state.repoState.error, null);
      });

      group('and the repository request throws an exception', () {
        Exception givenException = Exception();

        setUp(() {
          when(mockGithubRepository.loadRepos(givenQuery)).thenThrow(givenException);

          store.dispatch(QueryChangedAction(query: givenQuery));
        });

        test('should set the error', () {
          expect(store.state.repoState.error, givenException.toString());
        });
      });

      group('and the repository request succeeds without issue', () {
        List<Repo> givenList = <Repo>[
          Repo(
            name: 'some name',
            stars: 120,
          ),
        ];

        setUp(() {
          when(mockGithubRepository.loadRepos(givenQuery)).thenAnswer((_) => Future.value(givenList));

          store.dispatch(QueryChangedAction(query: givenQuery));
        });

        test('should set the data', () {
          expect(store.state.repoState.data, givenList);
        });
      });
    });
  });
}
