class UserSaveDetailsRequest {
  String? id;
  String? name;
  String? email;
  String? mobile;
  String? createdon;

  UserSaveDetailsRequest(
      {this.id, this.name, this.email, this.mobile, this.createdon});

  UserSaveDetailsRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    createdon = json['createdon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['createdon'] = this.createdon;
    return data;
  }
}
