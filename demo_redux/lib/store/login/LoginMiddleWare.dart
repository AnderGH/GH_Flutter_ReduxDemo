
import 'package:demo_redux/store/AppStoreState.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppStoreState> login(String name, ValueChanged<bool> result) {
  return (Store<AppStoreState> store) {
    Future.delayed(Duration(seconds: 1), () {
      bool success = true;
      if (success) {
        result(true);
      } else {
        result(false);
      }
    });
  };
}

ThunkAction<AppStoreState> loginOut(ValueChanged<bool> result) {
  return (Store<AppStoreState> store) {
    bool success = true;
      if (success) {
        result(true);
      } else {
        result(false);
      }
  };
}
