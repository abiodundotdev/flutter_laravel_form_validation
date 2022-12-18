String buildMessage(String message, String? attribute, [String? extra]) {
  return attribute != null
      ? message
          .replaceAll("field", attribute.toLowerCase())
          .replaceAll("extra", extra ?? "")
      : message;
}
