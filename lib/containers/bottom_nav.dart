import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_boilerplate/actions/actions.dart';
import 'package:flutter_redux_boilerplate/models/app_state.dart';
import 'package:flutter_redux_boilerplate/selectors/selectors.dart';
import 'package:redux/redux.dart';

class BottomNav extends StatelessWidget {

  BottomNav({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return BottomNavigationBar(
          currentIndex: viewModel.selectedBottomNav,
          onTap: viewModel.onBottomNavSelected,
          items: _getItems(),
        );
      },
    );
  }

  List<BottomNavigationBarItem> _getItems() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.list),
        title: Text('Repos'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text('Dummy 1'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.vibration),
        title: Text('Dummy 2'),
      ),
    ];
  }
}

class _ViewModel {
  final int selectedBottomNav;
  final Function(int) onBottomNavSelected;

  _ViewModel({
    @required this.selectedBottomNav,
    @required this.onBottomNavSelected,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      selectedBottomNav: selectedBottomNavSelector(store.state),
      onBottomNavSelected: (index) => store.dispatch(ChangeBottomNavAction(index: index)),
    );
  }
}