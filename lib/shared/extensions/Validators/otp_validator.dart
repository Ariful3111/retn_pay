String? otpValidation(String? value) {
  final text = (value ?? '').trim();
  if (text.isEmpty) {
    return "OTP is required";
  }
  
  // Check if it contains only digits
  final RegExp digitsOnly = RegExp(r'^\d+$');
  if (!digitsOnly.hasMatch(text)) {
    return "OTP must be digits only";
  }

  // Check minimum length (3 digits)
  if (text.length < 3) {
    return "OTP must be at least 3 digits";
  }

  return null;
}
