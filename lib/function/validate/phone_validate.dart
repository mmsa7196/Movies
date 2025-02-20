phoneValidate(String val) {
  if (val.length != 13) {
    return "Make sure your number is correct. It must be in the format: +201*********";
  }
  return null;
}
