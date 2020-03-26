
import 'package:demo_redux/store/login/LoginActions.dart';
import 'package:demo_redux/store/login/LoginModel.dart';

LoginModel loginReducer(LoginModel state, dynamic action) {
  if (action is LoginAction) {
    return LoginModel(true, action.displayName);
  } else if (action is LoginOutAction) {
    return LoginModel(false, null);
  } else {
    return state;
  }
}
