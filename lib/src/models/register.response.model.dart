class RegisterModelResponse {
  final bool success;
  final String message;

  RegisterModelResponse({required this.message, required this.success});


  //metodo de fabrica
  factory RegisterModelResponse.fromJson(Map<String, dynamic> json) {
    return RegisterModelResponse(
        message: json['message'] ?? "", success: json['success'] ?? false);
  }
}
