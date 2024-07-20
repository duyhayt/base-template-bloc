enum DioMethod { get, post, delete, put, patch }

extension DioMethodString on DioMethod {
  String get string {
    switch (this) {
      case DioMethod.get:
        return "get";
      case DioMethod.post:
        return "post";
      case DioMethod.delete:
        return "delete";
      case DioMethod.patch:
        return "patch";
      case DioMethod.put:
        return "put";
    }
  }
}

abstract class APIRequestRepresentable {
  bool? get requestToken; //option thêm acctoken vào request
  String get url;
  String get endpoint;
  String get path;
  DioMethod get method;
  Map<String, String>? get headers;
  Map<String, String>? get query;
  dynamic get body;
  Future request();
}