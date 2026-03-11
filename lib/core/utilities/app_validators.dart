class AppValidators {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(email)) {
      return 'This Email is not valid';
    }

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }

    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }

    if (!RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$").hasMatch(password)) {
      return 'password must be Min 8 chars, upper, lower, number & symbol';
    }

    return null;
  }

  static String? confirmPassword(String? password, String? confirmPassword) {
    if (password != confirmPassword ||
        confirmPassword == null ||
        confirmPassword.isEmpty) {
      return 'Password not matched';
    }

    return null;
  }

  static String? validateEmptyTextFormField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'Phone number is required';
    }

    if (!RegExp(r'^(010|011|012|015)[0-9]{8}$').hasMatch(phoneNumber)) {
      return 'Invalid Egyptian phone number';
    }

    return null;
  }
}
