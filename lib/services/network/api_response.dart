import 'package:equatable/equatable.dart';

class ApiResponse<T> extends Equatable {
  final Status status;
  final T? body;
  final String? message;
  final int? statusCode;

  const ApiResponse.loading()
      : status = Status.loading,
        body = null,
        statusCode = null,
        message = '';

  const ApiResponse.completed(this.body)
      : status = Status.completed,
        statusCode = null,
        message = '';

  ApiResponse.error(
    String? message,
  )   : status = Status.error,
        message = message?.split(',').first,
        statusCode = message?.split(',').last != null
            ? int.parse(message!.split(',').last)
            : null,
        body = null;

  bool hasData() {
    return status != Status.loading && body != null;
  }

  @override
  String toString() {
    return 'Status : $status \n Message : $message \n Data : $body';
  }

  @override
  List<Object?> get props => [status, body, message];
}

enum Status { loading, completed, error }
