
import 'dart:convert';

import 'package:bloc/bloc.dart';

import '../../models/user/user_response.dart';
import '../../repository/authentication/authentication_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.dart';
part 'authentication_cubit.freezed.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  

  final authenticationRepository = AuthenticationRepository();
  late Account  user;
  
  AuthenticationCubit() : super(const AuthenticationState.initial(),);


  Future loginWithEmailAndPassword(String email, String password) async {
    emit(AuthenticationState.loading());

    try {
      final  user = await authenticationRepository.login(email, password);

    
      if (user.token !=null ) {

        print('======> ${user.token}');
       

        return emit(AuthenticationState.loaded(user));

      } else {
        emit(AuthenticationState.error());
      }
    } catch (e) {
      return emit(AuthenticationState.error());
    }
  }
}
