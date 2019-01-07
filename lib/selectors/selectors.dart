import 'package:flutter/material.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/models/repo_state.dart';

Widget rootScreenSelector(AppState state) => state.navState.rootScreen;

int selectedBottomNavSelector(AppState state) => state.navState.selectedBottomNav;

RepoState repoStateSelector(AppState state) => state.repoState;