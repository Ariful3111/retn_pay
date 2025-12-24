String? phoneValidation(String? value) {
  final text = (value ?? '').trim();
  if (text.isEmpty) {
    return "Phone number is required";
  }
  // ignore: deprecated_member_use
  final RegExp phoneReg = RegExp(r'^(?:\+?88)?01[3-9]\d{8}$');
  if (phoneReg.hasMatch(text)) {
    return null;
  }
  return "Enter a valid phone number";
}
