import 'package:demo_redux/login/AddInfo.dart';
import 'package:demo_redux/login/Login.dart';
import 'package:demo_redux/login/LoginOut.dart';
import 'package:demo_redux/store/AppStore.dart';
import 'package:demo_redux/store/AppStoreState.dart';
import 'package:demo_redux/store/login/LoginModel.dart';
import 'package:demo_redux/store/user/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // 创建store
  final Store<AppStoreState> store = createStore();

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppStoreState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
        routes: {
          'LoginPage': (context) => LoginPage(),
          'LoginOutPage': (context) => LoginOutPage(),
          'AddUserInfo': (context) => AddUserInfo(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('主页'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Builder(builder: (context) {
              Store<AppStoreState> store =
                  StoreProvider.of<AppStoreState>(context);
              LoginModel loginModel = store.state.loginModel;
              if (loginModel.isLogin) {
                return Text('姓名：' + loginModel.displayName);
              } else {
                return Text('未登录');
              }
            }),
            Builder(builder: (context) {
              Store<AppStoreState> store =
                  StoreProvider.of<AppStoreState>(context);
              UserModel userModel = store.state.userModel;
              if (userModel.nickName != null) {
                return Text('nickName：' + userModel.nickName);
              } else {
                return Container();
              }
            }),
            RaisedButton(
              child: Text('登录页面'),
              onPressed: () {
                Navigator.of(context).pushNamed('LoginPage');
              },
            ),
            RaisedButton(
              child: Text('注销页面'),
              onPressed: () {
                Navigator.of(context).pushNamed('LoginOutPage');
              },
            ),
            RaisedButton(
              child: Text('添加昵称'),
              onPressed: () {
                Navigator.of(context).pushNamed('AddUserInfo');
              },
            ),
          ],
        ),
      ),
    );
  }
}
