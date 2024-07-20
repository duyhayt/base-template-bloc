import 'package:base_template_bloc/core/providers/api_endpoint.dart';
import 'package:base_template_bloc/core/providers/api_provider.dart';
import 'package:base_template_bloc/core/providers/api_request_representable.dart';

enum Type { fetchPosts }

class PostAPI implements APIRequestRepresentable {
  final Type type;

  const PostAPI._({required this.type});

  PostAPI.fetchPosts() : this._(type: Type.fetchPosts);

  @override
  get body => null;

  @override
  String get endpoint => APIEndpoint.endpoint;

  @override
  Map<String, String>? get headers => null;

  @override
  DioMethod get method => DioMethod.get;

  @override
  String get path => '/posts';

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
