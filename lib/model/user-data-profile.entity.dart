class UserDataProfile {
  String uuid;
  String name;
  String email;

  UserDataProfile({String uuid, String name, String email}) {
    this.uuid = uuid;
    this.name = name;
    this.email = email;
  }

  UserDataProfile.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}
