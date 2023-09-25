// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      account: Account.fromJson(json['Account'] as Map<String, dynamic>),
      token: json['token'] as String,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'Account': instance.account,
      'token': instance.token,
    };

_$_Account _$$_AccountFromJson(Map<String, dynamic> json) => _$_Account(
      id: json['id'] as String,
      name: json['name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as int,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      role: json['role'] as String,
      image: json['image'] as String,
      createdDate: json['created_date'] as String,
      acceptedTerm: json['acceptedTerm'] as bool,
      date: json['date'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$_AccountToJson(_$_Account instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'role': instance.role,
      'image': instance.image,
      'created_date': instance.createdDate,
      'acceptedTerm': instance.acceptedTerm,
      'date': instance.date,
      'password': instance.password,
    };

_$_Address _$$_AddressFromJson(Map<String, dynamic> json) => _$_Address(
      address: json['address'] as String,
      state: json['state'] as String,
      countryCode: json['country_code'] as String,
      countryFlag: json['country_flag'] as String,
    );

Map<String, dynamic> _$$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'address': instance.address,
      'state': instance.state,
      'country_code': instance.countryCode,
      'country_flag': instance.countryFlag,
    };
