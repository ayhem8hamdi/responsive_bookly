import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

abstract class Failure {
  final String message;
  final String code;

  Failure({required this.message, required this.code});

  UIFeedbackType get uiFeedbackType;

  factory Failure.fromException(Object error) {
    if (error is DioException) {
      return ServerFailure.fromDioError(error);
    } else if (error is FormatException) {
      return ParsingFailure(
          message: 'Data format error', code: 'PARSING_ERROR');
    } else if (error is AuthenticationException) {
      return AuthenticationFailure(message: error.message, code: 'AUTH_ERROR');
    } else if (error is DatabaseException) {
      return DatabaseFailure(message: error.message, code: 'DB_ERROR');
    } else if (error is PlatformException) {
      return PlatformFailure(
        message: error.message ?? 'Platform error',
        code: 'PLATFORM_ERROR',
      );
    } else if (error is Exception) {
      return UnknownFailure(
        message: error.toString(),
        code: 'UNKNOWN_EXCEPTION_ERROR',
      );
    } else {
      return UnknownFailure(
        message: 'An unexpected error occurred: ${error.toString()}',
        code: 'UNKNOWN_ERROR',
      );
    }
  }
}

class ServerFailure extends Failure {
  ServerFailure({required super.message, required super.code});

  @override
  UIFeedbackType get uiFeedbackType => UIFeedbackType.snackbar;

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          message: 'Connection timeout with server',
          code: 'CONNECTION_TIMEOUT',
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure(
          message: 'Send timeout with server',
          code: 'SEND_TIMEOUT',
        );
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          message: 'Receive timeout with server',
          code: 'RECEIVE_TIMEOUT',
        );
      case DioExceptionType.badCertificate:
        return ServerFailure(
          message: 'Bad certificate from server',
          code: 'BAD_CERTIFICATE',
        );
      case DioExceptionType.badResponse:
        final statusCode = dioException.response?.statusCode ?? 0;
        if (statusCode >= 400 && statusCode < 500) {
          return HttpFailure(
            message: 'Client error: ${dioException.message}',
            code: 'HTTP_CLIENT_ERROR',
          );
        } else if (statusCode >= 500) {
          return HttpFailure(
            message: 'Server error: ${dioException.message}',
            code: 'HTTP_SERVER_ERROR',
          );
        } else {
          return HttpFailure(
            message: 'Unexpected HTTP error',
            code: 'HTTP_UNKNOWN',
          );
        }
      case DioExceptionType.cancel:
        return ServerFailure(
          message: 'Request was cancelled',
          code: 'REQUEST_CANCELLED',
        );
      case DioExceptionType.connectionError:
        return ServerFailure(
          message: 'Connection error. Please check your internet connection',
          code: 'CONNECTION_ERROR',
        );
      case DioExceptionType.unknown:
      default:
        return ServerFailure(
          message: 'Unknown server error',
          code: 'UNKNOWN_SERVER_ERROR',
        );
    }
  }
}

class HttpFailure extends ServerFailure {
  HttpFailure({required super.message, required super.code});

  @override
  UIFeedbackType get uiFeedbackType => UIFeedbackType.dialog;
}

class AuthenticationFailure extends Failure {
  AuthenticationFailure({required super.message, required super.code});

  @override
  UIFeedbackType get uiFeedbackType => UIFeedbackType.snackbar;
}

class ParsingFailure extends Failure {
  ParsingFailure({required super.message, required super.code});

  @override
  UIFeedbackType get uiFeedbackType => UIFeedbackType.snackbar;
}

class PlatformFailure extends Failure {
  PlatformFailure({required super.message, required super.code});

  @override
  UIFeedbackType get uiFeedbackType => UIFeedbackType.dialog;
}

class DatabaseFailure extends Failure {
  DatabaseFailure({required super.message, required super.code});

  @override
  UIFeedbackType get uiFeedbackType => UIFeedbackType.snackbar;
}

class UnknownFailure extends Failure {
  UnknownFailure({required super.message, required super.code});

  @override
  UIFeedbackType get uiFeedbackType => UIFeedbackType.dialog;
}

enum UIFeedbackType { snackbar, dialog, none }

class AuthenticationException implements Exception {
  final String message;
  AuthenticationException(this.message);
}

class DatabaseException implements Exception {
  final String message;
  DatabaseException(this.message);
}

class ImageProcessingFailure extends Failure {
  ImageProcessingFailure({required super.message, required super.code});

  @override
  UIFeedbackType get uiFeedbackType => UIFeedbackType.snackbar;

  factory ImageProcessingFailure.fromException(Object error) {
    return ImageProcessingFailure(
      message: 'Image processing error: ${error.toString()}',
      code: 'IMAGE_PROCESSING_ERROR',
    );
  }
}

class InvalidUrlFailure extends Failure {
  InvalidUrlFailure({required super.message, required super.code});

  @override
  UIFeedbackType get uiFeedbackType => UIFeedbackType.none;

  factory InvalidUrlFailure.fromUrl(String url) {
    return InvalidUrlFailure(
      message: 'Invalid image URL: $url',
      code: 'INVALID_IMAGE_URL',
    );
  }
}
