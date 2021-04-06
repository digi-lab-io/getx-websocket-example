class UserDataProfile {
  String _uuid;
  String _name;
  String _email;

  UserDataProfile({String uuid, String name, String email}) {
    this._uuid = uuid;
    this._name = name;
    this._email = email;
  }

  String get uuid => _uuid;

  set uuid(String uuid) => _uuid = uuid;

  String get name => _name;

  set name(String name) => _name = name;

  String get email => _email;

  set email(String email) => _email = email;

  UserDataProfile.fromJson(Map<String, dynamic> json) {
    _uuid = json['uuid'];
    _name = json['name'];
    _email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this._uuid;
    data['name'] = this._name;
    data['email'] = this._email;
    return data;
  }
}
