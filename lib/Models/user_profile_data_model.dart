class UserProfileDataModel {
  bool? success;
  Data? data;

  UserProfileDataModel({this.success, this.data});

  UserProfileDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? iId;
  String? username;
  String? email;
  String? gender;
  String? country;
  String? dateOfBirth;
  String? phoneNumber;
  String? ethnicity;

  Data(
      {this.iId,
        this.username,
        this.email,
        this.gender,
        this.country,
        this.dateOfBirth,
        this.phoneNumber,
        this.ethnicity});

  Data.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    username = json['username'];
    email = json['email'];
    gender = json['gender'];
    country = json['country'];
    dateOfBirth = json['DateOfBirth'];
    phoneNumber = json['phoneNumber'];
    ethnicity = json['ethnicity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.iId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['country'] = this.country;
    data['DateOfBirth'] = this.dateOfBirth;
    data['phoneNumber'] = this.phoneNumber;
    data['ethnicity'] = this.ethnicity;
    return data;
  }
}