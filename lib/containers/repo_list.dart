import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_boilerplate/actions/actions.dart';
import 'package:flutter_redux_boilerplate/components/error_text.dart';
import 'package:flutter_redux_boilerplate/components/loading.dart';
import 'package:flutter_redux_boilerplate/components/repo_list_tile.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/models/repo.dart';
import 'package:flutter_redux_boilerplate/models/repo_state.dart';
import 'package:flutter_redux_boilerplate/screens/owner_details_screen.dart';
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

        if (viewModel.repoState.data.totalCount == 0) return Container();

        final List<Repo> repoItems = viewModel.repoState.data.items;

        return ListView.separated(
          itemCount: repoItems.length,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (BuildContext context, int index) {
            return RepoListTile(
              repo: repoItems[index],
              onTap: (String ownerName) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) {
                    return OwnerDetailsScreen(ownerName: ownerName);
                  }
                ));
                viewModel.onListTileTap(ownerName);
              },
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
  final Function(String) onListTileTap;

  _ViewModel({
    @required this.repoState,
    @required this.onListTileTap,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      repoState: repoStateSelector(store.state),
      onListTileTap: (ownerName) => store.dispatch(LoadOwnerDetailsAction(owner: ownerName)),
    );
  }
}