import 'dart:async';
import 'dart:io' show File;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared/shared.dart';

//ignore_for_file: public_member_api_docs
/// RestClient class is used to make API calls using Dio.
class RestClient {
  /// Constructor for RestClient
  RestClient() {
    final options = BaseOptions(
      connectTimeout: const Duration(milliseconds: connectionTimeout),
      receiveTimeout: const Duration(milliseconds: receiveTimeout),
      headers: <String, dynamic>{
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    _dio = Dio(options);
    _setDioInterceptors();
  }

  late final Dio _dio;

  static const int connectionTimeout = 30000;
  static const int receiveTimeout = 30000;

  Future<Response<dynamic>> get(
    APIType apiType,
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    final standardHeaders = await _getOptions(apiType);
    return _handleRequest(
        () => _dio.get(path, queryParameters: data, options: standardHeaders));
  }

  Future<Response<dynamic>> post(
    APIType apiType,
    String path,
    Map<String, dynamic> data, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    final standardHeaders = await _getOptions(apiType);
    return _handleRequest(() => _dio.post(path,
        data: data, options: standardHeaders, queryParameters: queryParams));
  }

  Future<Response<dynamic>> postFormData(
    APIType apiType,
    String path,
    Map<String, dynamic> data, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    final standardHeaders = await _getOptions(apiType);
    return _handleRequest(() => _dio.post(path,
        data: FormData.fromMap(data),
        options: standardHeaders,
        queryParameters: queryParams));
  }

  Future<Response<dynamic>> patch(
    APIType apiType,
    String path,
    Map<String, dynamic> data, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    final standardHeaders = await _getOptions(apiType);
    return _handleRequest(() => _dio.patch(path,
        data: data, options: standardHeaders, queryParameters: queryParams));
  }

  Future<Response<dynamic>> put(
    APIType apiType,
    String path,
    Map<String, dynamic> data, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    final standardHeaders = await _getOptions(apiType);
    return _handleRequest(() => _dio.put(path,
        data: data, options: standardHeaders, queryParameters: queryParams));
  }

  Future<Response<dynamic>> delete(
    APIType apiType,
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    final standardHeaders = await _getOptions(apiType);
    return _handleRequest(() => _dio.delete(path,
        data: data, options: standardHeaders, queryParameters: queryParams));
  }

  Future<Response<dynamic>> fileUploadInS3Bucket({
    required String preAssignedUrl,
    required File file,
  }) async {
    return _handleRequest(() async => _dio.put(
          preAssignedUrl,
          data: file.openRead(),
          options: Options(
              headers: {Headers.contentLengthHeader: await file.length()}),
        ));
  }

  Future<Response<dynamic>> _handleRequest(
      Future<Response<dynamic>> Function() request) async {
    try {
      return await request();
    } catch (error) {
      _handleDioError(error);
      rethrow; // Rethrow after handling to allow further upstream handling if needed.
    }
  }

  void _handleDioError(dynamic error) {
    if (error is DioException) {
      logE('DIO ERROR: ${error.type} ENDPOINT: ${error.requestOptions.baseUrl}'
          '${error.requestOptions.path}');

      switch (error.type) {
        case DioExceptionType.cancel:
          throw RequestCancelled('Request Cancelled');
        case DioExceptionType.connectionTimeout:
          throw ConnectionTimeout('Connection Timeout');
        case DioExceptionType.receiveTimeout:
          throw RequestTimeout('Request Timeout');
        case DioExceptionType.sendTimeout:
          throw SendTimeout('Send Timeout');
        case DioExceptionType.badResponse:
          throw BadResponse('Bad Response');
        case DioExceptionType.connectionError:
          // TODO(msi): message,
          throw ConnectionError('Connection Error');
        case DioExceptionType.badCertificate:
          throw BadCertificate('Bad Certificate');
        case DioExceptionType.unknown:
          throw UnknownDioError('Unknown Error');
      }
    } else {
      throw Exception('Something went wrong in Dio. Please try again.');
    }
  }

  /// Makes the Log Grey
  void greyLogger(Object message) {
    if (message is String) {
      if (kDebugMode) {
        print('\x1B[37m$message\x1B[0m');
      }
    } else {
      if (kDebugMode) {
        print(message);
      }
    }
  }

  void _setDioInterceptors() {
    final interceptorList = <Interceptor>[];
    if (kDebugMode) {
      interceptorList.add(
        PrettyDioLogger(
          logPrint: greyLogger,
        ),
      );
    }
    _dio.interceptors.addAll(interceptorList);
  }

  Future<Options> _getOptions(APIType api) async {
    const token = '';
    if (api == APIType.protected) {
      return Options(headers: {'Authorization': 'Bearer $token'});
    }
    return Options(); // Default options for public APIs
  }
}

/// ApiOptions abstract class to define different API options
abstract class ApiOptions {
  Options options = Options();
}

// Enum for API Types
enum APIType { public, protected }
