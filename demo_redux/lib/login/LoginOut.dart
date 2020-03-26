import 'package:demo_redux/store/login/LoginActions.dart';
import 'package:demo_redux/store/login/LoginMiddleWare.dart';
import 'package:demo_redux/store/AppStoreState.dart';
import 'package:demo_redux/store/login/LoginModel.dart';
import 'package:demo_redux/store/user/UserActions.dart';
import 'package:demo_redux/store/user/UserMiddleWare.dart';
import 'package:demo_redux/store/user/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class LoginOutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注销页面'),
      ),
      body: StoreConnector<AppStoreState, LoginModel>(
        builder: (context, vm) {
          return Center(
            child: Column(
              children: <Widget>[
                Builder(builder: (context) {
                  Store<AppStoreState> store = StoreProvider.of<AppStoreState>(context);
                  LoginModel loginModel = store.state.loginModel;
                  if (loginModel.isLogin) {
                    return Text('姓名：' + loginModel.displayName);
                  } else {
                    return Text('未登录');
                  }
                }),
                Builder(builder: (context) {
                  Store<AppStoreState> store = StoreProvider.of<AppStoreState>(context);
                  UserModel userModel = store.state.userModel;
                  if (userModel.nickName != null) {
                    return Text('nickName：' + userModel.nickName);
                  } else {
                    return Text('nickName：');
                  }
                }),
                RaisedButton(
                  child: Text('注销'),
                  onPressed: () {
                    Store<AppStoreState> store = StoreProvider.of<AppStoreState>(context);
                    store.dispatch(loginOut((success) {
                      if (success) {
                        store.dispatch(LoginOutAction());
                      }
                    }));
                    store.dispatch(removeNickName((success){
                      if (success) {
                        store.dispatch(RemoveNickName());
                      }
                    }));
                  },
                ),
              ],
            ),
          );
        },
        converter: (store) {
          return store.state.loginModel;
        },
      ),
    );
  }
}
