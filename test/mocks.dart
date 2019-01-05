import 'package:flutter_redux_boilerplate/services/github_repository.dart';
import 'package:flutter_redux_boilerplate/services/github_web_client.dart';
import 'package:mockito/mockito.dart';

class MockGithubRepository extends Mock implements GithubRepository {}
class MockGithubWebClient extends Mock implements GithubWebClient {}