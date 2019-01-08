import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_boilerplate/components/error_text.dart';
import 'package:flutter_redux_boilerplate/components/loading.dart';
import 'package:flutter_redux_boilerplate/components/partial_bold_text.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/models/owner_details_result.dart';
import 'package:flutter_redux_boilerplate/models/owner_details_state.dart';
import 'package:flutter_redux_boilerplate/selectors/selectors.dart';
import 'package:redux/redux.dart';

class OwnerDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        if (viewModel.ownerDetailsState.isLoading) {
          return Loading();
        }

        if (viewModel.ownerDetailsState.error != null) {
          return ErrorText(error: viewModel.ownerDetailsState.error);
        }

        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: _createColumn(context, viewModel),
          ),
        );
      },
    );
  }

  Column _createColumn(BuildContext context, _ViewModel viewModel) {
    OwnerDetailsResult data = viewModel.ownerDetailsState.data;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        PartialBoldText(
          boldText: 'Login: ',
          normalText: data.login,
          defaultText: 'Not set',
        ),
        PartialBoldText(
          boldText: 'Name: ',
          normalText: data.name,
          defaultText: 'Not set',
        ),
        PartialBoldText(
          boldText: 'Location: ',
          normalText: data.location,
          defaultText: 'Not set',
        ),
        PartialBoldText(
          boldText: 'Public Repos: ',
          normalText: data.publicRepos.toString(),
          defaultText: 'Not set',
        ),
        PartialBoldText(
          boldText: 'Followers: ',
          normalText: data.followers.toString(),
          defaultText: 'Not set',
        ),
        PartialBoldText(
          boldText: 'Following: ',
          normalText: data.following.toString(),
          defaultText: 'Not set',
        ),
      ],
    );
  }
}

@immutable
class _ViewModel {
  final OwnerDetailsState ownerDetailsState;

  _ViewModel({
    @required this.ownerDetailsState,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      ownerDetailsState: ownerDetailsStateSelector(store.state),
    );
  }
}
