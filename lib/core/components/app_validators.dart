class AppValidators {

  // ========== Required ==========
  static String? requiredField(String? value, {String message = 'This field is required',}) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    return null;
  }

  // ========== Name ==========
  static String? name(String? value, {int minLength = 3}) {
    if (requiredField(value, message: 'Name is required') != null) {
      return 'Name is required';
    }

    if (value!.trim().length < minLength) {
      return 'Name must be at least $minLength characters';
    }

    final nameRegex = RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$');
    if (!nameRegex.hasMatch(value.trim())) {
      return 'Name can only contain letters';
    }

    return null;
  }

  // ========== Email ==========
  static String? email(String? value) {
    if (requiredField(value, message: 'Email is required') != null) {
      return 'Email is required';
    }

    final emailRegex =
    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value!.trim())) {
      return 'This email is not valid';
    }
    return null;
  }

  // ========== Password ==========
  static String? password(String? value, {int minLength = 8}) {
    if (requiredField(value, message: 'Password is required') != null) {
      return 'Password is required';
    }

    if (value!.length < minLength) {
      return 'Password must be at least $minLength characters';
    }
    return null;
  }

  // ========== Confirm Password ==========
  static String? confirmPassword(String? value, String password) {
    if (requiredField(value, message: 'Confirm password is required') != null) {
      return 'Confirm password is required';
    }

    if (value != password) {
      return 'Password not matched';
    }
    return null;
  }

  // ========== Phone ==========
  static String? phone(String? value) {
    if (requiredField(value, message: 'Phone number is required') != null) {
      return 'Phone number is required';
    }

    final phoneRegex = RegExp(r'^(01)[0-9]{9}$'); // Egypt
    if (!phoneRegex.hasMatch(value!.trim())) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  // ========== Min Length ==========
  static String? minLength(String? value, int length) {
    if (value == null || value.trim().length < length) {
      return 'Must be at least $length characters';
    }
    return null;
  }
}
