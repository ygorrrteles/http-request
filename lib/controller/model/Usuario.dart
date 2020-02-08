class Usuario {
  String sub;
  int userId;
  List<Roles> roles;
  int exp;


  Usuario({this.sub, this.userId, this.roles, this.exp});

  Usuario.fromJson(Map<String, dynamic> json) {
    sub = json['sub'];
    userId = json['user_id'];
    if (json['roles'] != null) {
      roles = new List<Roles>();
      json['roles'].forEach((v) {
        roles.add(new Roles.fromJson(v));
      });
    }
    exp = json['exp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub'] = this.sub;
    data['user_id'] = this.userId;
    if (this.roles != null) {
      data['roles'] = this.roles.map((v) => v.toJson()).toList();
    }
    data['exp'] = this.exp;
    return data;
  }
}

class Roles {
  String name;
  String description;
  Roles({this.name, this.description});

  Roles.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Roles &&
              runtimeType == other.runtimeType &&
              name == other.name;

  @override
  int get hashCode => name.hashCode;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}
