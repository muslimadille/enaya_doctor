enum NetworkRequestEnum {
  get,
  post,
  put,
  delete
}

extension NetworkRequestExtension on NetworkRequestEnum {
  String get value {
    switch (this) {
      case NetworkRequestEnum.get:
        return 'GET';
      case NetworkRequestEnum.post:
        return 'POST';
      case NetworkRequestEnum.put:
        return 'PUT';
      case NetworkRequestEnum.delete:
        return 'DELETE';
    }
  }
}