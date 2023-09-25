import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';



@freezed
abstract class User with _$User {
  const factory User({
    @JsonKey(name: 'Account') required  Account account,
    required String token,

  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}


@freezed
abstract class Account with _$Account {
  const factory Account({
    required String id,
    required String name,
    @JsonKey(name: 'last_name') required String lastName,
    required String email,
    required int phone,
    required Address address,
    required String role,
    required String image,
    @JsonKey(name: 'created_date') required String createdDate,
    @JsonKey(name: 'acceptedTerm') required bool acceptedTerm,
    required String date,
    required String password,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);
}

@freezed
abstract class Address with _$Address {
  const factory Address({
    required String address,
    required String state,
    @JsonKey(name: 'country_code') required String countryCode,
    @JsonKey(name: 'country_flag') required String countryFlag,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}


