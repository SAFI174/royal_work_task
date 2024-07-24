class FieldValidations {
  static String? empty(String? value) {
    if (value!.isEmpty) {
      return "This field is required!";
    }
    return null;
  }

  static String? email(String? value) {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    final isValid = emailRegex.hasMatch(value!);
    if (!isValid) {
      return "Please enter a valid email!";
    }

    return null;
  }

  static String? password(String? value) {
    if (value!.length < 6) {
      return "Password must be 6 char or more!";
    }

    return null;
  }
}
