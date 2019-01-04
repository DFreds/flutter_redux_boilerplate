import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_boilerplate/actions/actions.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:redux/redux.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Query',
            ),
            onChanged: viewModel.onQueryChanged,
          ),
        );
      },
    );
  }
}

@immutable
class _ViewModel {
  final Function(String) onQueryChanged;

  _ViewModel({
    @required this.onQueryChanged,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      onQueryChanged: (query) {
        if (query.length < 3) return;
        store.dispatch(QueryChangedAction(query: query));
      }
    );
  }

  // TODO hash code and equals
}
