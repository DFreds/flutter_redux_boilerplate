import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_boilerplate/actions/actions.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:rx_command/rx_command.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        // TODO could utilize this
        // viewModel.textChangedCommand
        //     .distinct()
        //     .takeWhile((query) => query.isNotEmpty)
        //     .debounce(Duration(milliseconds: 2000))
        //     .listen((query) {
        //   viewModel.onQueryChanged(query);
        // });

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
  // final RxCommand<String, String> textChangedCommand;

  _ViewModel({
    @required this.onQueryChanged,
    // @required this.textChangedCommand,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      onQueryChanged: (query) =>
          store.dispatch(QueryChangedAction(query: query)),
      // textChangedCommand: RxCommand.createSync((s) => s),
    );
  }

  // TODO hash code and equals
}
