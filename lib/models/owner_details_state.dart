import 'package:flutter_redux_boilerplate/models/owner_details_result.dart';
import 'package:meta/meta.dart';

@immutable
class OwnerDetailsState {
  final bool isLoading;
  final OwnerDetailsResult data;
  final String error;

  OwnerDetailsState({
    @required this.isLoading,
    @required this.data,
    @required this.error,
  });

  factory OwnerDetailsState.initial() {
    return OwnerDetailsState(
      isLoading: false,
      data: OwnerDetailsResult(),
      error: null,
    );
  }

  OwnerDetailsState copyWith({
    bool isLoading,
    OwnerDetailsResult data,
    String error,
  }) {
    return OwnerDetailsState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OwnerDetailsState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          data == other.data &&
          error == other.error;

  @override
  int get hashCode => isLoading.hashCode ^ data.hashCode ^ error.hashCode;
}
