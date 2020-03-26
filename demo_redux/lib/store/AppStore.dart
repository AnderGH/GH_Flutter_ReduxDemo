import 'package:redux/redux.dart';
import 'package:demo_redux/store/AppStoreReducer.dart';
import 'package:demo_redux/store/AppStoreState.dart';
import 'package:redux_thunk/redux_thunk.dart';

Store<AppStoreState> createStore() {
  return Store(appStoreReducer, initialState: AppStoreState.init(), middleware: [
    thunkMiddleware
  ]);
}

