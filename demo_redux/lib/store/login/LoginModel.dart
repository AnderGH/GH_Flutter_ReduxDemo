
class LoginModel {
  bool isLogin;
  String displayName;

  LoginModel(
    this.isLogin,
    this.displayName,
  );

  // 初始化方法
  factory LoginModel.init() {
    return LoginModel(
      false,
      null,
    );
  }
}
