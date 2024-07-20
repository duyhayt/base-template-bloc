import 'dart:async';
import 'package:base_template_bloc/core/providers/api_request_representable.dart';
import 'package:dio/dio.dart';

class APIProvider {
  final _dio = Dio();

  get dio => _dio;
  static final _singleton = APIProvider();

  static APIProvider get instance => _singleton;

  APIProvider() {
    _dio.interceptors.add(
      InterceptorsWrapper(onRequest: (option, handler) {
        // Kiểm tra xem có gửi token trong header hay không
        if (option.preserveHeaderCase) {
        }
        return handler.next(option);
      }, onResponse: (response, handler) {
        return handler.next(response);
      }, onError: (error, handler) async {
        if (error.response?.statusCode == 401 || error.response?.statusCode == 403) {
          //Nếu nhận được lỗi 401 hoặc 403, thì refresh lại token
          try {
            return handler.resolve(await _dio.fetch(error.requestOptions));
          } catch (e) {
            //Nếu refresh token hết hạn
            return handler.reject(error);
          }
        }
        return handler.next(error);
      }),
    );
  }

  Future request(APIRequestRepresentable request) async {
    String method = request.method.string;
    try {
      late Response response;
      switch (method) {
        case 'get':
          response = await _dio.get(request.url,
              data: request.body,
              queryParameters: request.query,
              options: Options(headers: request.headers, preserveHeaderCase: request.requestToken));
          break;
        case 'post':
          response = await _dio.post(request.url,
              data: request.body,
              queryParameters: request.query,
              options: Options(headers: request.headers, preserveHeaderCase: request.requestToken));
          break;
        case 'put':
          response = await _dio.put(request.url,
              data: request.body,
              queryParameters: request.query,
              options: Options(headers: request.headers, preserveHeaderCase: request.requestToken));
          break;
        case 'patch':
          response = await _dio.patch(request.url,
              data: request.body,
              queryParameters: request.query,
              options: Options(headers: request.headers, preserveHeaderCase: request.requestToken));
          break;
        case 'delete':
          response = await _dio.delete(request.url,
              data: request.body,
              queryParameters: request.query,
              options: Options(headers: request.headers, preserveHeaderCase: request.requestToken));
          break;
      }
      return _returnResponse(response);
    } on DioException catch (error) {
      if (error.response != null) {
        return _returnResponse(error.response!);
      } else {
        rethrow;
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
        throw UnauthorisedException(response.data.toString());
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 404:
        throw BadRequestException('Not found');
      case 500:
        throw FetchDataException('Internal Server Error');
      default:
        throw FetchDataException('Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

class AppException implements Exception {
  final dynamic code;
  final String? message;
  final dynamic details;

  AppException({this.code, this.message, this.details});

  @override
  String toString() {
    return "[$code]: $message \n $details";
  }
}

class FetchDataException extends AppException {
  FetchDataException(String? details)
      : super(
          code: "fetch-data",
          message: "Error During Communication",
          details: details,
        );
}

class BadRequestException extends AppException {
  BadRequestException(String? details)
      : super(
          code: "invalid-request",
          message: "Invalid Request",
          details: details,
        );
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String? details)
      : super(
          code: "unauthorised",
          message: "Unauthorised",
          details: details,
        );
}

class InvalidInputException extends AppException {
  InvalidInputException(String? details)
      : super(
          code: "invalid-input",
          message: "Invalid Input",
          details: details,
        );
}

class AuthenticationException extends AppException {
  AuthenticationException(String? details)
      : super(
          code: "authentication-failed",
          message: "Authentication Failed",
          details: details,
        );
}

class TimeOutException extends AppException {
  TimeOutException(String? details)
      : super(
          code: "request-timeout",
          message: "Request TimeOut",
          details: details,
        );
}