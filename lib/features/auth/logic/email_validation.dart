class EmailValidation {
static  String ? emailValidation(String? value) {
  if (value == null || value.isEmpty) {
  return "Email Or username is required";
  } else if (!RegExp(
  r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
      .hasMatch(value) &&
  !RegExp(r'^[a-zA-Z0-9_]{3,20}$').hasMatch(value)) {
  return "Please enter a valid email Or username";
  } else {
  return null;
  }
  }
}