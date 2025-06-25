class AuthAPIController {
  static String api = "https://r2ait.up.railway.app/users";
  static String allUsers = "${api}/all";
  static String singleUser(String id) => "${api}/$id";
  static String userLogin = "${api}/login";
  static String userSignUp = "${api}/signup";
}
