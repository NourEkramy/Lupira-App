class detectionQuestionsModel {
  bool? success;
  List<Questions>? questions;

  detectionQuestionsModel({this.success, this.questions});

  detectionQuestionsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String? sId;
  int? questionNumber;
  String? questionText;
  List<String>? options;
  int? iV;
  String? createdAt;
  String? updatedAt;

  Questions(
      {this.sId,
        this.questionNumber,
        this.questionText,
        this.options,
        this.iV,
        this.createdAt,
        this.updatedAt});

  Questions.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    questionNumber = json['questionNumber'];
    questionText = json['questionText'];
    options = json['options'].cast<String>();
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['questionNumber'] = this.questionNumber;
    data['questionText'] = this.questionText;
    data['options'] = this.options;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}