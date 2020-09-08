class ApiResponse {
  bool success;
  String error;
  dynamic data;

  ApiResponse({
    this.success,
    this.error,
    this.data,
  }) {
    success = false;
    error = '';
    data = null;
  }
}
