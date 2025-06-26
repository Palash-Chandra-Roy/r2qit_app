import 'global_api.dart';
class AuthAPIController {
  static String allUsers = "${api}/all";
  static String singleUser(String id) => "${api}/$id";
  static String userLogin = "${api}/login";
  static String userSignUp = "${api}/signup";
}
