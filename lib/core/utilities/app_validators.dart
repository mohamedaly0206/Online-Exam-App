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

    if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!RegExp(
        r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$")
        .hasMatch(password)) {
      return 'password must contain upper and lowercase, number and symbol';
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
    if (value == null || value
        .trim()
        .isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? validateName(String? value, String fieldName) {
    if (value == null || value
        .trim()
        .isEmpty) {
      return '$fieldName is required';
    }

    final trimmedValue = value.trim();

    if (trimmedValue.length < 3) {
      return '$fieldName length must be at least 3 characters long';
    }

    final nameRegex = RegExp(r'^[a-zA-Z]+$');

    if (!nameRegex.hasMatch(trimmedValue)) {
      return '$fieldName must contain letters only';
    }
    if (value.contains(' ')) {
      return '$fieldName cannot contain spaces';
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
