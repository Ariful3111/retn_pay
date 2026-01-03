String? nameValidation(String? value) {
  final text = (value ?? '');
  if (text.isEmpty) {
    return "Name is required";
  }
  if (text.length < 3) {
    return "Name must be at least 3 characters";
  }
  // ignore: deprecated_member_use
  final RegExp name = RegExp(r"^[A-za-z]+(?: [A-za-z]*)?$");
  if (!name.hasMatch(text)) {
    return 'You can\'t use number or special character';
  }
  return null;
}
