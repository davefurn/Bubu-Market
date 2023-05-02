class CollectionList {
  CollectionList({
    this.billboards,
  });

  CollectionList.fromJson(dynamic json) {
    billboards = json['billboards'] != null
        ? Billboards.fromJson(json['billboards'])
        : null;
  }

  Billboards? billboards;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (billboards != null) {
      map['billboards'] = billboards?.toJson();
    }
    return map;
  }
}

class Billboards {
  Billboards({
    this.id,
    this.owner,
    this.date_created,
    this.date_updated,
    this.banner,
  });

  Billboards.fromJson(dynamic json) {
    id = json['id'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    date_created = json['date_created'];
    date_updated = json['date_updated'];
    banner = json['banner'];
  }

  int? id;
  Owner? owner;
  String? date_created;
  String? date_updated;
  String? banner;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
     if (owner != null) {
      map['owner'] = owner?.toJson();
    }
    map['date_created'] = date_created;
    map['date_updated'] = date_updated;
    map['banner'] = banner;

   
    return map;
  }
}

class Owner {
  Owner({
    this.id,
    this.last_login,
    this.is_superuser,
    this.username,
    this.first_name,
    this.last_name,
    this.email,
    this.is_staff,
    this.is_active,
    this.date_joined,
    this.groups,
    this.user_permissions,
  });

  Owner.fromJson(dynamic json) {
    id = json['id'];
    last_login = json['last_login'];
    is_superuser = json['is_superuser'];
    username = json['username'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    email = json['email'];
    is_staff = json['is_staff'];
    is_active = json['is_active'];
    date_joined = json['date_joined'];
    groups = json['groups'];
    user_permissions = json['user_permissions'];
  }

  int? id;
  String? last_login;
  bool? is_superuser;
  String? username;
  String? first_name;
  String? last_name;
  String? email;
  bool? is_staff;
  bool? is_active;
  String? date_joined;
  List<String>? groups;
  List<String>? user_permissions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['last_login'] = last_login;
    map['is_superuser'] = is_superuser;
    map['username'] = username;
    map['first_name'] = first_name;
    map['last_name'] = last_name;
    map['email'] = email;
    map['is_staff'] = is_staff;
    map['is_active'] = is_active;
    map['date_joined'] = date_joined;
    map['groups'] = groups;
    map['user_permissions'] = user_permissions;

    return map;
  }
}
