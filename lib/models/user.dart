import "package:json_annotation/json_annotation.dart";

part "user.g.dart";

@JsonSerializable()
class UserList {
  UserList({this.users});

  final List<User> users;

  factory UserList.fromJson(List<dynamic> json) =>
      _$UserListFromJson({'users': json});

  Map<String, dynamic> toJson() => _$UserListToJson(this);
}

@JsonSerializable()
class User {
  User({
    this.id,
    this.phone,
    this.name,
    this.username,
    this.email,
    this.website,
    this.address,
    this.company,
  });

  final int id;
  final String name, username, email, website, phone;
  final Address address;
  final Company company;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Address {
  Address({this.street, this.city, this.suite, this.zipcode, this.geo});

  final String street, suite, city, zipcode;
  final Geo geo;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class Geo {
  Geo({this.lat, this.lng});

  final String lat, lng;

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);

  Map<String, dynamic> toJson() => _$GeoToJson(this);
}

@JsonSerializable()
class Company {
  Company({this.name, this.bs, this.catchPhrase});

  final String name, catchPhrase, bs;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
