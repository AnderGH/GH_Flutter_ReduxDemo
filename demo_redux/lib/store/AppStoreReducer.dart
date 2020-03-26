import 'package:demo_redux/store/AppStoreState.dart';
import 'package:demo_redux/store/login/LoginReducer.dart';
import 'package:demo_redux/store/user/UserReducer.dart';

AppStoreState appStoreReducer(AppStoreState state, dynamic action) {
  return AppStoreState(
    loginReducer(state.loginModel, action),
    userRecuder(state.userModel, action),
  );
}
