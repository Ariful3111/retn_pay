String? emailOrPhoneValidation(String? value) {
  final text = (value ?? '').trim();
  if (text.isEmpty) {
    return "Email or Phone number is required";
  }

  // Email Regex
  final RegExp emailReg = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  // Phone Regex: Must start with 880, followed by 1, then 3-9, then 8 digits.
  final RegExp phoneReg = RegExp(r'^8801[3-9]\d{8}$');

  if (emailReg.hasMatch(text) || phoneReg.hasMatch(text)) {
    return null;
  }

  // Provide specific error message based on input
  if (!text.contains('@') && RegExp(r'^[0-9+]+$').hasMatch(text)) {
    return "Must be a valid phone number. Example: 880XXXXXXXXX";
  }

  if (text.contains('@')) {
    return "Enter a valid email address";
  }

  return "Enter a valid email or phone number";
}
