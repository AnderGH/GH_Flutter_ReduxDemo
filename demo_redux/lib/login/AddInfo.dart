import 'package:demo_redux/store/AppStoreState.dart';
import 'package:demo_redux/store/login/LoginModel.dart';
import 'package:demo_redux/store/user/UserActions.dart';
import 'package:demo_redux/store/user/UserMiddleWare.dart';
import 'package:demo_redux/store/user/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class AddUserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('修改页面'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            StoreConnector<AppStoreState, LoginModel>(
              builder: (context, vm) {
                Store<AppStoreState> store = StoreProvider.of<AppStoreState>(context);
                LoginModel loginModel = store.state.loginModel;
                if (loginModel.isLogin) {
                  return Text('姓名：' + loginModel.displayName);
                } else {
                  return Text('姓名：');
                }
              },
              converter: (store) {
                return store.state.loginModel;
              },
            ),
            StoreConnector<AppStoreState, UserModel>(
              builder: (context, vm) {
                Store<AppStoreState> store = StoreProvider.of<AppStoreState>(context);
                UserModel userModel = store.state.userModel;
                if (userModel.nickName != null) {
                  return Text('nickname：' + userModel.nickName);
                } else {
                  return Text('nickname：');
                }
              },
              converter: (store) {
                return store.state.userModel;
              },
            ),
            RaisedButton(
              child: Text('添加昵称'),
              onPressed: () {
                Store<AppStoreState> store = StoreProvider.of<AppStoreState>(context);
                store.dispatch(addNickName('Ander', (success) {
                  if (success) {
                    store.dispatch(AddNickName('Ander'));
                  }
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
