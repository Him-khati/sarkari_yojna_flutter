import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retry/retry.dart';
import 'package:sarkari_yojna_flutter/utils/logger/logger.dart';
import 'package:sarkari_yojna_flutter/utils/networking/url_helper.dart';

import 'exceptions/client_side_exception.dart';
import 'exceptions/gateway_timeout_exception.dart';
import 'exceptions/networking_exception.dart';
import 'exceptions/server_internal_error_exception.dart';
import 'exceptions/session_expired_exception.dart';
import 'exceptions/unable_to_process_server_response.dart';

class NetworkingUtil {
  /// Networking Constants
  static const tag = "NetworkingUtil";

  static const sendTimeOut = Duration(seconds: 60);
  static const receiveTimeOut = Duration(seconds: 30);
  static const retryOptions = RetryOptions(maxAttempts: 4);

  //External Dependencies
  final UrlHelper _urlHelper;
  final Dio _dio;
  final Logger _logger;
  final String _baseUrl;

  NetworkingUtil({
    required UrlHelper urlHelper,
    required Dio dio,
    required Logger logger,
    required String baseUrl,
  })  : _urlHelper = urlHelper,
        _dio = dio,
        _logger = logger,
        _baseUrl = baseUrl;

  Future<T> get<T>(
    String urlEndPoint,
    T Function(String responseJson) fromJsonConverter, {
    dynamic queryParams,
    Map<String, dynamic>? headers,
    Map<String, String>? pathParams,
  }) async {
    return await retryOptions.retry(
      () => _getRequest(
        urlEndPoint,
        fromJsonConverter,
        queryParams: queryParams,
        headers: headers,
        pathParams: pathParams,
      ),
      retryIf: (e) => e is GatewayTimeOutException,
    );
  }

  Future<T> _getRequest<T>(
    String urlEndPoint,
    T Function(String responseJson) fromJsonConverter, {
    dynamic queryParams,
    Map<String, dynamic>? headers,
    Map<String, String>? pathParams,
  }) async {
    final url = await _urlHelper.prepareFullUrlWithParams(
      baseUrl: _baseUrl,
      endPoint: urlEndPoint,
      pathParams: pathParams ?? <String, String>{},
    );
    final defaultHeaders = await _urlHelper.getHeaders();

    try {
      final responseFromServer = await _dio.get(
        url,
        queryParameters: queryParams,
        options: Options(
          sendTimeout: sendTimeOut,
          headers: mergeMaps(defaultHeaders, headers),
          receiveTimeout: receiveTimeOut,
          responseType: ResponseType.plain,
        ),
      );

      final jsonStringFromResponse =
          _checkForSuccessElseThrow(responseFromServer);
      return tryConvertingResponseJsonToRequiredType(
          jsonStringFromResponse, fromJsonConverter);
    } on DioException catch (e, s) {
      throw _handleDioException(e, s);
    } on Exception {
      rethrow;
    }
  }

  Future<T> post<T>(
    String urlEndPoint,
    dynamic data,
    T Function(String responseJson) fromJsonConverter, {
    Map<String, String?>? queryParams,
    Map<String, dynamic>? headers,
    Map<String, String>? pathParams,
    bool jsonEncodeBody = false,
  }) async {
    return await retryOptions.retry(
      () => _postRequest(
        urlEndPoint,
        data,
        fromJsonConverter,
        queryParams: queryParams,
        headers: headers,
        pathParams: pathParams,
        jsonEncodeBody: jsonEncodeBody,
      ),
      retryIf: (e) => e is GatewayTimeOutException,
    );
  }

  Future<T> _postRequest<T>(
    String urlEndPoint,
    dynamic data,
    T Function(String responseJson) fromJsonConverter, {
    Map<String, String?>? queryParams,
    Map<String, dynamic>? headers,
    Map<String, String>? pathParams,
    bool jsonEncodeBody = false,
  }) async {
    final url = await _urlHelper.prepareFullUrlWithParams(
      baseUrl: _baseUrl,
      endPoint: urlEndPoint,
      pathParams: pathParams ?? <String, String>{},
    );

    final defaultHeaders = await _urlHelper.getHeaders();

    try {
      final responseFromServer = await _dio.post(
        url,
        queryParameters: queryParams,
        data: jsonEncodeRequestBody(data, jsonEncodeBody),
        options: Options(
          sendTimeout: sendTimeOut,
          headers: mergeMaps(defaultHeaders, headers),
          receiveTimeout: receiveTimeOut,
          responseType: ResponseType.plain,
        ),
      );

      final jsonStringFromResponse = _checkForSuccessElseThrow(
        responseFromServer,
      );

      return tryConvertingResponseJsonToRequiredType(
        jsonStringFromResponse,
        fromJsonConverter,
      );
    } on DioException catch (e, s) {
      throw _handleDioException(e, s);
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<T> put<T>(String urlEndPoint, dynamic data,
      T Function(String responseJson) fromJsonConverter,
      {Map<String, String?>? queryParams,
      Map<String, dynamic>? headers,
      Map<String, String>? pathParams,
      bool jsonEncodeBody = false}) async {
    return await retryOptions.retry(
      () => _putRequest(
        urlEndPoint,
        data,
        fromJsonConverter,
        queryParams: queryParams,
        headers: headers,
        pathParams: pathParams,
        jsonEncodeBody: jsonEncodeBody,
      ),
      retryIf: (e) => e is GatewayTimeOutException,
    );
  }

  Future<T> _putRequest<T>(
    String urlEndPoint,
    dynamic data,
    T Function(String responseJson) fromJsonConverter, {
    Map<String, String?>? queryParams,
    Map<String, dynamic>? headers,
    Map<String, String>? pathParams,
    bool jsonEncodeBody = false,
  }) async {
    final url = await _urlHelper.prepareFullUrlWithParams(
      baseUrl: _baseUrl,
      endPoint: urlEndPoint,
      pathParams: pathParams ?? <String, String>{},
    );

    final defaultHeaders = await _urlHelper.getHeaders();

    try {
      final responseFromServer = await _dio.put(
        url,
        queryParameters: queryParams,
        data: jsonEncodeRequestBody(data, jsonEncodeBody),
        options: Options(
          sendTimeout: sendTimeOut,
          headers: mergeMaps(defaultHeaders, headers),
          receiveTimeout: receiveTimeOut,
          responseType: ResponseType.plain,
        ),
      );

      final jsonStringFromResponse =
          _checkForSuccessElseThrow(responseFromServer);

      return tryConvertingResponseJsonToRequiredType(
        jsonStringFromResponse,
        fromJsonConverter,
      );
    } on DioException catch (e, s) {
      throw _handleDioException(e, s);
    } on Exception {
      rethrow;
    }
  }

  String _checkForSuccessElseThrow(Response<dynamic> responseFromServer) {
    if (responseFromServer.statusCode == null) {
      throw const NetworkingException();
    } else if (responseFromServer.statusCode! == 401) {
      throw SessionExpiredException();
    } else if (responseFromServer.statusCode! == 504) {
      throw GatewayTimeOutException("Timeout while processing request", null);
    } else if (responseFromServer.statusCode! >= 500) {
      throw const InternalServerErrorException();
    } else if (responseFromServer.statusCode! >= 200 &&
        responseFromServer.statusCode! < 499) {
      return responseFromServer.toString();
    } else {
      throw UnimplementedError("not implemented");
    }
  }

  T tryConvertingResponseJsonToRequiredType<T>(
    String jsonStringFromResponse,
    T Function(String responseJson) fromJsonConverter,
  ) {
    try {
      return fromJsonConverter(jsonStringFromResponse);
    } catch (e) {
      if (e is TypeError) {
        _logger.e(
          tag,
          "error while deserializing json",
          e,
          s: e.stackTrace,
        );
      } else {
        _logger.e(
          tag,
          "error while deserializing json",
          e,
        );
      }
      throw const UnableToProcessServerResponse();
    }
  }

  jsonEncodeRequestBody(data, bool jsonEncodeBody) {
    if (jsonEncodeBody) {
      return jsonEncode(data);
    } else {
      return data;
    }
  }

  Exception _handleDioException(DioException e, StackTrace s) {
    if (e.error is SocketException) {
      return const NetworkingException();
    } else if (e.response?.statusCode == 401) {
      throw SessionExpiredException();
    } else if (e.response?.statusCode == 504) {
      throw GatewayTimeOutException("Timeout while processing request", s);
    } else if (e.response?.statusCode != null &&
        e.response!.statusCode! >= 500) {
      return const InternalServerErrorException();
    } else if (e.response?.statusCode != null &&
        e.response!.statusCode! >= 400 &&
        e.response!.statusCode! < 500) {
      if (e.response?.data is String) {
        return ClientSideException(
            e.response?.data?.toString() ?? "Unable to process request", s);
      } else if (e.response?.data["msg"] != null) {
        return ClientSideException(
            e.response?.data["msg"].toString() ?? "Unable to process request",
            s);
      } else if (e.response?.data["message"] != null) {
        return ClientSideException(
            e.response?.data["message"].toString() ??
                "Unable to process request",
            s);
      } else {
        return e;
      }
    } else {
      return e;
    }
  }

  Map<String, dynamic> mergeMaps(
    Map<String, dynamic> headers,
    Map<String, dynamic>? headers2,
  ) {
    Map<String, dynamic> finalMap = {};

    finalMap.addAll(headers);
    if (headers2 != null) {
      finalMap.addAll(headers2);
    }

    return finalMap;
  }
}
