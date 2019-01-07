import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/selectors/selectors.dart';
import 'package:redux/redux.dart';

class TotalResultsText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return Container(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            '${viewModel.totalResults} results',
          ),
        );
      },
    );
  }
}

class _ViewModel {
  final int totalResults;

  _ViewModel({
    @required this.totalResults,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      totalResults: totalResultsSelector(store.state),
    );
  }
}