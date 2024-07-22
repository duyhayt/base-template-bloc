import 'package:base_template_bloc/core/providers/api_endpoint.dart';
import 'package:base_template_bloc/core/providers/api_provider.dart';
import 'package:base_template_bloc/core/providers/api_request_representable.dart';

enum Type { fetchPosts, fetchUser }

class HomeAPI implements APIRequestRepresentable {
  final Type type;

  const HomeAPI._({required this.type});

  HomeAPI.fetchPosts() : this._(type: Type.fetchPosts);
  HomeAPI.fetchUser() : this._(type: Type.fetchUser);

  @override
  get body => null;

  @override
  String get endpoint => APIEndpoint.endpoint;

  @override
  Map<String, String>? get headers => null;

  @override
  DioMethod get method => DioMethod.get;

  @override
  String get path {
    switch (type) {
      case Type.fetchPosts:
        return '/posts';
      case Type.fetchUser:
        return '/users';
    }
  }

  @override
  Map<String, String>? get query => null;

  @override
  Future request() {
    return APIProvider().request(this);
  }

  @override
  bool? get requestToken => false;

  @override
  String get url => endpoint + path;
}
