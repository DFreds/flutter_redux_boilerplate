import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_boilerplate/components/error_text.dart';
import 'package:flutter_redux_boilerplate/components/loading.dart';
import 'package:flutter_redux_boilerplate/components/repo_list_tile.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/models/repo_state.dart';
import 'package:flutter_redux_boilerplate/selectors/selectors.dart';
import 'package:redux/redux.dart';

class RepoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        if (viewModel.repoState.isLoading) {
          return Loading();
        }

        if (viewModel.repoState.error != null) {
          return ErrorText(error: viewModel.repoState.error);
        }

        if (viewModel.repoState.data.isEmpty) return Container();

        return ListView.separated(
          itemCount: viewModel.repoState.data.length,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (BuildContext context, int index) {
            return RepoListTile(
              repo: viewModel.repoState.data[index],
            );
          },
        );
      },
    );
  }
}

@immutable
class _ViewModel {
  final RepoState repoState;

  _ViewModel({
    @required this.repoState,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      repoState: repoStateSelector(store.state),
    );
  }
}