extension NameExtractor on String {
  (String firstName, String lastName) extractNameParts() {
    String fullName = trim();
    String firstName = "";
    String lastName = "";

    if (fullName.isNotEmpty) {
      List<String> nameParts = fullName.split(" ");
      firstName = nameParts[0];
      if (nameParts.length > 1) {
        lastName = nameParts.sublist(1).join(" ");
      }
    }

    return (firstName, lastName);
  }
}
