import 'package:dio/dio.dart' hide Response, FormData, MultipartFile;
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:e_shop_ui/core/imports/core_imports.dart';

import '../main.dart';

// initializations
final BaseOptions options = BaseOptions(
  baseUrl: Endpoints.baseUrl,
  responseType: ResponseType.json,
  contentType: Headers.jsonContentType,
  headers: {'Accept': 'application/json'},
  validateStatus: (statusCode) {
    if (statusCode == null) {
      return false;
    }
    if (statusCode == 422 || statusCode == 413) {
      // your http status code
      return true;
    } else {
      return statusCode >= 200 && statusCode < 300;
    }
  },
  // connectTimeout: const Duration(seconds: 5),
  // sendTimeout: const Duration(seconds: 3),
);

Dio dio = Dio(options)
  ..interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printRequestHeaders: true,
        printResponseMessage: true,
      ),
    ),
  );
