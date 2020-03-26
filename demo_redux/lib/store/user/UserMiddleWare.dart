
import 'package:demo_redux/store/AppStoreState.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppStoreState> addNickName(String nickName, ValueChanged<bool> success) {
  return (Store<AppStoreState> store) {
    success(true);
  };
}

ThunkAction<AppStoreState> removeNickName(ValueChanged<bool> success) {
  return (Store<AppStoreState> store) {
    success(true);
  };
}
