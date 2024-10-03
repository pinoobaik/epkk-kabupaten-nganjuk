import 'package:dio/dio.dart';

class DioErrorHandler {
  static void handleError(DioException error) {
    String errorMessage;

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage = "Connection Timeout. Please check your internet connection.";
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = "Receive Timeout. The server took too long to respond.";
        break;
      case DioExceptionType.badResponse:
        errorMessage = _handleBadResponse(error);
        break;
      case DioExceptionType.cancel:
        errorMessage = "Request was cancelled.";
        break;
      case DioExceptionType.connectionError:
        errorMessage = "Failed to connect to the server. Please try again.";
        break;
      default:
        errorMessage = "Unexpected error occurred. Please try again.";
        break;
    }

    // Log the error for debugging
    print("DioError: $errorMessage, Response: ${error.response?.data}");

    throw Exception(errorMessage);
  }

  // Function to handle bad responses (400-500)
  static String _handleBadResponse(DioException error) {
    switch (error.response?.statusCode) {
      case 400:
        return "Bad Request: ${error.response?.data['message'] ?? 'Invalid request'}";
      case 401:
        return "Unauthorized. Please login again.";
      case 403:
        return "Forbidden. You do not have access to this resource.";
      case 404:
        return "Not Found: The requested resource could not be found.";
      case 500:
        return "Server Error. Please try again later.";
      default:
        return "Unknown error: ${error.response?.statusCode}. ${error.response?.data['message'] ?? 'No additional information'}";
    }
  }
}
