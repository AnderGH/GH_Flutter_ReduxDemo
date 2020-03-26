class UserModel {
  String nickName;
  UserModel(
    this.nickName,
  );

  factory UserModel.init() {
    return UserModel(
      null,
    );
  }
}
