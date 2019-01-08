import 'package:flutter/material.dart';
import 'package:flutter_redux_boilerplate/containers/owner_details.dart';

class OwnerDetailsScreen extends StatelessWidget {
  final String ownerName;

  OwnerDetailsScreen({
    @required this.ownerName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(),
      body: OwnerDetails(),
    );
  }

  AppBar _createAppBar() {
    return AppBar(
      title: Text('User $ownerName details'),
    );
  }
}