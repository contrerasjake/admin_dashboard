import 'dart:convert';

import 'package:admin_dashboard/common/application/api/urls.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'api.freezed.dart';

@freezed
class ApiResponse with _$ApiResponse {
  const ApiResponse._();

  @override
  String? get message => when(
        success: (request, data, message) => message ?? '',
        warning: (request, data, message) => message ?? '',
        unexpectedError: (message, error, stackTrace) => message,
        timeoutExceeded: (message, error, stackTrace) => message,
      );

  const factory ApiResponse.success({
    Map<String, dynamic>? request,
    dynamic data,
    String? message,
  }) = ApiResponseSuccess;
  const factory ApiResponse.warning({
    Map<String, dynamic>? request,
    dynamic data,
    String? message,
  }) = ApiResponseWarning;
  // Client Error
  const factory ApiResponse.unexpectedError(String message, Object error,
      [StackTrace? stackTrace]) = ApiResponseUnexpectedError;
  // Client Error
  const factory ApiResponse.timeoutExceeded(String message, Object error,
      [StackTrace? stackTrace]) = ApiResponseTimeout;
}

final dioProvider = Provider((ref) {
  final x = Dio();
  x.options.baseUrl = DioSettings.baseUrl;
  x.options.connectTimeout = DioSettings.connectTimeout;
  x.options.receiveTimeout = DioSettings.receiveTimeout;
  return x;
});

class DioSettings {
  static const baseUrl = ApiUrls.baseUrl;
  static const connectTimeout = Duration(milliseconds: 5000);
  static const receiveTimeout = Duration(milliseconds: 3000);
}

class DioController {
  final Dio dio;
  DioController({required this.dio});

  Future<ApiResponse> post(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    try {
      // Initialize shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, dynamic>? user;
      user = prefs.getString('user') == null
          ? null
          : jsonDecode(prefs.getString('user')!);
      final token = user == null ? '' : user['token'];
      dio.options.headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      };
      final response = await dio.post(
        path,
        data: data,
      );
      switch (response.statusCode) {
        case 200:
          return ApiResponse.success(
            data: response.data,
            message: (response.data is Map) ? response.data['message'] : '',
          );
        default:
          return ApiResponse.unexpectedError(
            'Unexpected response status',
            response.data,
          );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return ApiResponse.timeoutExceeded(e.message ?? e.error.toString(), e);
      }
      final message = e.response?.data['Message'] ?? e.error.toString();
      return ApiResponse.unexpectedError(
          e.response != null ? 'Request failed:\n$message' : e.error.toString(),
          e);
    } catch (e, st) {
      return ApiResponse.unexpectedError(
          'Unexpected error [${e.runtimeType}]', e, st);
    }
  }

  Future<ApiResponse> get(String path) async {
    try {
      // Initialize shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, dynamic>? user;
      user = prefs.getString('user') == null
          ? null
          : jsonDecode(prefs.getString('user')!);
      final token = user == null ? '' : user['token'];
      dio.options.headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      };
      final response = await dio.get(
        path,
      );
      switch (response.statusCode) {
        case 200:
          return ApiResponse.success(
            data: response.data,
            message: (response.data is Map) ? response.data['message'] : '',
          );
        default:
          return ApiResponse.unexpectedError(
            'Unexpected response status',
            response.data,
          );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return ApiResponse.timeoutExceeded(e.message ?? e.error.toString(), e);
      }
      final message = e.response?.data['Message'] ?? e.error.toString();
      return ApiResponse.unexpectedError(
          e.response != null ? 'Request failed:\n$message' : e.error.toString(),
          e);
    } catch (e, st) {
      return ApiResponse.unexpectedError(
          'Unexpected error [${e.runtimeType}]', e, st);
    }
  }

  Future<ApiResponse> put(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    try {
      // Initialize shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, dynamic>? user;
      user = prefs.getString('user') == null
          ? null
          : jsonDecode(prefs.getString('user')!);
      final token = user == null ? '' : user['token'];
      dio.options.headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      };
      final response = await dio.put(
        path,
        data: data,
      );
      switch (response.statusCode) {
        case 200:
          return ApiResponse.success(
            data: response.data,
            message: (response.data is Map) ? response.data['message'] : '',
          );
        default:
          return ApiResponse.unexpectedError(
            'Unexpected response status',
            response.data,
          );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return ApiResponse.timeoutExceeded(e.message ?? e.error.toString(), e);
      }
      final message = e.response?.data['Message'] ?? e.error.toString();
      return ApiResponse.unexpectedError(
          e.response != null ? 'Request failed:\n$message' : e.error.toString(),
          e);
    } catch (e, st) {
      return ApiResponse.unexpectedError(
          'Unexpected error [${e.runtimeType}]', e, st);
    }
  }
}
