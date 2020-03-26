import 'package:demo_redux/store/user/UserActions.dart';
import 'package:demo_redux/store/user/UserModel.dart';

UserModel userRecuder(UserModel state, dynamic action) {
  if (action is AddNickName) {
    return UserModel(action.nickName);
  } else if (action is RemoveNickName) {
    return UserModel(null);
  } else {
    return state;
  }
}
