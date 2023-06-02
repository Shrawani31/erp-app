class ReportResponse {
  String? value;
  bool? success;
  String? resultMessage;

  ReportResponse({this.value, this.success, this.resultMessage});

  ReportResponse.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    success = json['success'];
    resultMessage = json['resultMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['success'] = this.success;
    data['resultMessage'] = this.resultMessage;
    return data;
  }
}
