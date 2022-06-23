String? isEmptyTitle(String? title) {
  if (title!.isEmpty) {
    return 'Please digit a title';
  }
  return null;
}

String? isEmptyBody(String? body) {
  if (body!.isEmpty) {
    return 'Please digit a body';
  }
  return null;
}
