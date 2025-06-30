class PasswordValidation {
 static String? validation (String value){
    if (value.isEmpty) {
  return "Password is required";
  }
  if (value.length < 6) {
  return "Password must be at least 6 characters long";
  }
  return null;}
}