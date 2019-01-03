import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/models/repo.dart';
import 'package:flutter_redux_boilerplate/selectors/selectors.dart';
import 'package:redux/redux.dart';

class RepoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        if (viewModel.repos.isEmpty) return Container();

        return ListView.builder(
          itemCount: viewModel.repos.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(viewModel.repos[index].name),
              trailing: Text(viewModel.repos[index].stars.toString()),
            );
          },
        );
      },
    );
  }
}

@immutable
class _ViewModel {
  final List<Repo> repos;

  _ViewModel({
    @required this.repos,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      repos: reposSelector(store.state),
    );
  }
}