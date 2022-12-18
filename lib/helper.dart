String buildMessage(String message, String? attribute, [String? extra]) {
  if (attribute != null) {
    return message.replaceAll("field", attribute.toLowerCase());
  }
  if (extra != null) {
    return message.replaceAll("extra", extra.toLowerCase());
  }
  if (attribute != null && extra != null) {
    return message
        .replaceAll("field", attribute.toLowerCase())
        .replaceAll("extra", extra);
  }
  return message;
}
