// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserList _$UserListFromJson(Map<String, dynamic> json) {
  return UserList(
      users: (json['users'] as List)
          ?.map((e) =>
              e == null ? null : User.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$UserListToJson(UserList instance) =>
    <String, dynamic>{'users': instance.users};

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      id: json['id'] as int,
      phone: json['phone'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      website: json['website'] as String,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      company: json['company'] == null
          ? null
          : Company.fromJson(json['company'] as Map<String, dynamic>));
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'website': instance.website,
      'phone': instance.phone,
      'address': instance.address,
      'company': instance.company
    };

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
      street: json['street'] as String,
      city: json['city'] as String,
      suite: json['suite'] as String,
      zipcode: json['zipcode'] as String,
      geo: json['geo'] == null
          ? null
          : Geo.fromJson(json['geo'] as Map<String, dynamic>));
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'street': instance.street,
      'suite': instance.suite,
      'city': instance.city,
      'zipcode': instance.zipcode,
      'geo': instance.geo
    };

Geo _$GeoFromJson(Map<String, dynamic> json) {
  return Geo(lat: json['lat'] as String, lng: json['lng'] as String);
}

Map<String, dynamic> _$GeoToJson(Geo instance) =>
    <String, dynamic>{'lat': instance.lat, 'lng': instance.lng};

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return Company(
      name: json['name'] as String,
      bs: json['bs'] as String,
      catchPhrase: json['catchPhrase'] as String);
}

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'name': instance.name,
      'catchPhrase': instance.catchPhrase,
      'bs': instance.bs
    };
