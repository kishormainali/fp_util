import 'dart:typed_data';

import 'package:dio/dio.dart';

import 'logger.dart';

/// {@template dio_logger}
/// A [Interceptor] which logs the request and response.
/// {@endtemplate}
@Deprecated('use logger from fp_logger instead'
    'https://pub.dev/packages/fp_logger')
class DioLogger extends Interceptor {
  /// {@macro dio_logger}
  const DioLogger({
    this.request = true,
    this.requestHeader = false,
    this.requestBody = false,
    this.responseHeader = false,
    this.responseBody = true,
    this.error = true,
  });
  final bool request;
  final bool requestHeader;
  final bool requestBody;
  final bool responseHeader;
  final bool responseBody;
  final bool error;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (request) {
      _printRequest(options);
    }
    if (requestHeader) {
      _printRequestHeader(options);
    }
    if (requestBody && options.method != 'GET' && options.data != null) {
      final data = options.data;
      if (data is FormData) {
        final formMaps = {}
          ..addEntries(data.fields)
          ..addEntries(data.files);
        Logger.i(formMaps);
      } else {
        Logger.i(data);
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (responseHeader) _printResponseHeader(response);
    if (responseBody) _printResponse(response);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (error) {
      final messages = [
        'URI:: ${err.requestOptions.uri}',
        'Type:: ${err.type}',
        'Message:: ${err.message}',
        if (err.response != null) ...[
          'Status:: ${err.response?.statusCode}',
          'Status Message:: ${err.response?.statusMessage}',
        ],
      ];
      Logger.e(messages, error: err.error, stackTrace: err.stackTrace);
    }
    super.onError(err, handler);
  }

  void _printRequest(RequestOptions options) {
    final message = 'Method:: ${options.method} URI:: ${options.uri}';
    Logger.i(message);
  }

  void _printRequestHeader(RequestOptions options) {
    final requestHeaders = <String, dynamic>{...options.headers};
    requestHeaders.removeWhere((key, value) => key == 'Authorization');
    requestHeaders['contentType'] = options.contentType.toString();
    requestHeaders['responseType'] = options.responseType.toString();
    requestHeaders['queryParameters'] = options.queryParameters;
    requestHeaders['extra'] = options.extra;
    Logger.i(requestHeaders);
  }

  void _printResponseHeader(Response response) {
    final message =
        'Method:: ${response.requestOptions.method} URI:: ${response.requestOptions.uri} Status:: ${response.statusCode}';
    Logger.i(message);
  }

  void _printResponse(Response response) {
    final responseBody = response.data;
    if (responseBody is Map || responseBody is List) {
      Logger.i(responseBody);
    } else if (responseBody is Uint8List) {
      var chunks = [];
      for (var i = 0; i < responseBody.length; i += 20) {
        chunks.add(responseBody.sublist(
            i, i + 20 > responseBody.length ? responseBody.length : i + 20));
      }
      Logger.i(chunks);
    } else {
      Logger.i(responseBody.toString());
    }
  }
}
