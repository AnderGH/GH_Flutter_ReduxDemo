import 'package:demo_redux/store/login/LoginActions.dart';
import 'package:demo_redux/store/login/LoginMiddleWare.dart';
import 'package:demo_redux/store/AppStoreState.dart';
import 'package:demo_redux/store/login/LoginModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录页面'),
      ),
      body: StoreConnector<AppStoreState, LoginModel>(
        onInit: (store) {
          print('onInit');
        },
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
                RaisedButton(
                  child: Text('登录'),
                  onPressed: () {
                    Store<AppStoreState> store = StoreProvider.of<AppStoreState>(context);
                    store.dispatch(login('zhangsan', (success) {
                      if (success) {
                        store.dispatch(LoginAction('zhangsan', '张三', 'xxxxxxxxxxxxx', '11111'));
                      }
                    }));
                  },
                )
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
