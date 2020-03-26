
class LoginAction {
  String loginID;
  String displayName;
  String userGuid;
  String password;
  LoginAction(
    this.loginID,
    this.displayName,
    this.userGuid,
    this.password,
  );
}

class LoginOutAction {
  LoginOutAction();
}
