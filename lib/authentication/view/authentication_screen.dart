
// ignore_for_file: unnecessary_string_interpolations

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inmigra_user/core/screens/Athentications/Register_screen/register_screen.dart';


import '../../core/screens/Home_screen/home_screen.dart';
import '../../core/screens/Athentications/Forgot_password/forgot_password_screen.dart';
import '../cubit/authentication_cubit.dart';




class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading =
      false; // Step 1: Add a boolean variable to track the loading state

  Future<void> _loginWithEmailAndPassword(BuildContext context) async {

    final userCubit = context.read<AuthenticationCubit>();
    // Step 4: Set loading state to true when login process starts
    setState(() {
      _isLoading = true;
      
    });

    try {
      String email = emailController.text.trim();
      String password = passwordController.text;

      if (email.isEmpty || password.isEmpty) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Error"),
            content: const Text("Please enter both email and password."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          ),
        );
        return;
        
      }

      await userCubit.loginWithEmailAndPassword(email, password);



      userCubit.state.when(initial: () => {
        print('INITIAL ......')

      }, loading: () => {

        print('LOADING'),

      }, loaded: (user) => {


       Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        )
        
        
      }, error: () => {
          showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Error"),
            content: const Text("Login failed. Please check your credentials."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          ),
        ),
      });

 

 
  
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text("Error"),
          content: const Text("An error occurred. Please try again later."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    } finally {
      // Step 4: Set loading state to false when login process ends (either success or error)
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

      
       return Container(
        decoration: const BoxDecoration(
             image: DecorationImage(
              image: AssetImage('assets/images/back-img.png'),
              fit: BoxFit.cover
             ),
          ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: height * 0.3),
              Center(
                child: Image.asset(
                  'assets/images/logo-inmigra-white.png',
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
              ),
              const SizedBox(height: 30),
              
              Container(
                padding: const EdgeInsets.only(top: 5, left: 15, bottom: 5, right: 15),
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xFFD8DADC),
                            width: 2,
                          ),
                        ),
                        prefixIcon: const Icon(Icons.email),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xFFD8DADC),
                            width: 2,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.all(16),
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xFFD8DADC),
                            width: 2,
                          ),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Color(0xFFD8DADC),
                            width: 2,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.all(16),
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    Center(
                      child: _isLoading // Step 2: Wrap the login button with a Visibility widget
                          ? const CircularProgressIndicator() // Step 3: Show loading indicator while loading
                          : ElevatedButton(
                              onPressed: () => {

                            

                                  _loginWithEmailAndPassword(context),

                              },
                                
                                
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(400, 50),
                                backgroundColor: Colors.pink,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 14),
                                textStyle: const TextStyle(fontSize: 15),
                              ),
                              child: const Text(
                                "LOGIN",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ),
                    ),
                    SizedBox(height: height * 0.03),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              transitionsBuilder:
                                  (context, animation, _, child) {
                                return SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(0, 1),
                                    end: Offset.zero,
                                  ).animate(animation),
                                  child: child,
                                );
                              },
                              pageBuilder: (context, _, __) =>
                                   ForgotPasswordScreen( emailController: emailController,),
                            ),
                          );
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.1),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              transitionsBuilder:
                                  (context, animation, _, child) {
                                return SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(0, 1),
                                    end: Offset.zero,
                                  ).animate(animation),
                                  child: child,
                                );
                              },
                              pageBuilder: (context, _, __) =>
                                  const RegisterScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Don’t have an account? Join Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      
    );
  }
}
