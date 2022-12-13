import 'dart:convert';
GetUserDetailsModel getUserDetailsModelFromJson(String str) => GetUserDetailsModel.fromJson(json.decode(str));
String getUserDetailsModelToJson(GetUserDetailsModel data) => json.encode(data.toJson());
class GetUserDetailsModel {
  GetUserDetailsModel({
      this.status, 
      this.statuscode, 
      this.message, 
      this.data,});

  GetUserDetailsModel.fromJson(dynamic json) {
    status = json['status'];
    statuscode = json['statuscode'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? status;
  int? statuscode;
  String? message;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['statuscode'] = statuscode;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.userId, 
      this.name, 
      this.profilePic, 
      this.about, 
      this.phone, 
      this.country, 
      this.companyMail,});

  Data.fromJson(dynamic json) {
    userId = json['user_id'];
    name = json['name'];
    profilePic = json['profile_pic'];
    about = json['about'];
    phone = json['phone'];
    country = json['country'];
    companyMail = json['company_mail'];
  }
  String? userId;
  String? name;
  String? profilePic;
  String? about;
  String? phone;
  String? country;
  String? companyMail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['name'] = name;
    map['profile_pic'] = profilePic;
    map['about'] = about;
    map['phone'] = phone;
    map['country'] = country;
    map['company_mail'] = companyMail;
    return map;
  }

}