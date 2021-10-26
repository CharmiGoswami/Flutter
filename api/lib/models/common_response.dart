class Common_Response_Modal {
  String? status;
  String? message;

  Common_Response_Modal({this.status, this.message});

  factory Common_Response_Modal.fromJson(Map<String, dynamic> json) {
    return Common_Response_Modal(
        status: json['status'], message: json['message']);
  }
}
