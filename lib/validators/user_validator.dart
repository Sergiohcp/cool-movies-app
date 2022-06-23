String? isEmptyName(String? name) {
  if (name!.isEmpty) {
    return 'Invalid name';
  }
  return null;
}
