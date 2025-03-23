class ResponseModel<T> {
  final bool status;
  final String message;
  final T? data;
  final String? error;

  ResponseModel({
    required this.status,
    required this.message,
    this.data,
    this.error,
  });

  factory ResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) {
    return ResponseModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: json.containsKey('data') ? fromJsonT(json['data']) : null,
      error: json['error'] as String?,
    );
  }
}
