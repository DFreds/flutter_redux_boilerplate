import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/models/repo.dart';

List<Repo> reposSelector(AppState state) => state.repoState.repos;