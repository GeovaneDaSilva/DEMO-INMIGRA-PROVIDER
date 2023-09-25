// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'authentication_state.freezed.dart';
part of 'authentication_cubit.dart';



@freezed
class AuthenticationState with _$AuthenticationState {
 const factory AuthenticationState.initial() = _Initial;
 const factory AuthenticationState.loading() = _Loading;
 const factory AuthenticationState.loaded(User user) = _Loaded;
 const factory AuthenticationState.error() = _Error;


} 
