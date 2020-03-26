import 'package:demo_redux/store/login/LoginModel.dart';
import 'package:demo_redux/store/user/UserModel.dart';

class AppStoreState {
  LoginModel loginModel;
  UserModel userModel;

  AppStoreState(
    this.loginModel,
    this.userModel,
  );

  // 初始化方法
  factory AppStoreState.init() {
    return AppStoreState(
      LoginModel.init(),
      UserModel.init(),
    );
  }
}
