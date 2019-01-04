import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/models/repo_state.dart';

RepoState repoStateSelector(AppState state) => state.repoState;