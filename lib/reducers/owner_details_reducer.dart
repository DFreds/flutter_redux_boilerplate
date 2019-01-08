import 'package:flutter_redux_boilerplate/actions/actions.dart';
import 'package:flutter_redux_boilerplate/models/owner_details_result.dart';
import 'package:flutter_redux_boilerplate/models/owner_details_state.dart';
import 'package:redux/redux.dart';

Reducer<OwnerDetailsState> ownerDetailsReducer = combineReducers([
  TypedReducer<OwnerDetailsState, LoadOwnerDetailsAction>(_loadOwnerDetails),
  TypedReducer<OwnerDetailsState, OwnerDetailsLoadSuccessAction>(_ownerDetailsLoadSuccess),
  TypedReducer<OwnerDetailsState, OwnerDetailsLoadFailureAction>(_ownerDetailsLoadFailure),
]);

OwnerDetailsState _loadOwnerDetails(OwnerDetailsState state, LoadOwnerDetailsAction action) {
  return state.copyWith(
    isLoading: true,
    error: null,
  );
}

OwnerDetailsState _ownerDetailsLoadSuccess(OwnerDetailsState state, OwnerDetailsLoadSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    data: action.data,
    error: null,
  );
}

OwnerDetailsState _ownerDetailsLoadFailure(OwnerDetailsState state, OwnerDetailsLoadFailureAction action) {
  return state.copyWith(
    isLoading: false,
    data: OwnerDetailsResult(),
    error: action.error,
  );
}