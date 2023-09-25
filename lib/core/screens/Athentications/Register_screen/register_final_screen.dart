import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../authentication/view/authentication_screen.dart';

class RegisterFinalScreen extends StatefulWidget {
  const RegisterFinalScreen({super.key});

  @override
  _RegisterFinalScreenState createState() => _RegisterFinalScreenState();
}

class _RegisterFinalScreenState extends State<RegisterFinalScreen> {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool acceptedTerm = true;
  // TextEditingController phoneController = TextEditingController();
  // TextEditingController communityController = TextEditingController();

  File? _selectedImage;
  bool _isLoading = false;

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  Future<String?> _uploadImage(String uid) async {
    if (_selectedImage == null) return null;

    try {
      final storageReference =
          FirebaseStorage.instance.ref().child('profile_images/$uid.jpg');
      final uploadTask = await storageReference.putFile(_selectedImage!);
      final downloadUrl = await uploadTask.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Image Upload Error: $e');
      return null;
    }
  }

  void _showLoadingIndicator() {
    setState(() {
      _isLoading = true;
    });
  }

  void _hideLoadingIndicator() {
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _showSuccessDialog() async {
    await showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('Success'),
        content: Text('Registration successful!'),
        actions: [
          CupertinoDialogAction(
            child: Text('OK'),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _showErrorDialog(String errorMessage) async {
    await showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('Error'),
        content: Text(errorMessage),
        actions: [
          CupertinoDialogAction(
            child: Text('OK'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Stack(
        children: [
          Positioned(
            top: 80,
            left: 40,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              backgroundColor: Colors.pink,
              child: const Icon(Icons.close),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blue[900],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 56),
              GestureDetector(
                onTap: _pickImage,
                child: Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: _selectedImage != null
                        ? Image.file(_selectedImage!).image
                        : null,
                    child: _selectedImage == null
                        ? const Icon(
                            Icons.person,
                            size: 102,
                            color: Colors.grey,
                          )
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 8),
              TextField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  hintText: 'First Name',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 8),
              TextField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  hintText: 'Last Name',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 8),
              // TextField(
              //   controller: phoneController,
              //   decoration: const InputDecoration(
              //     prefixIcon: Icon(Icons.flag_circle),
              //     border: OutlineInputBorder(),
              //     hintText: 'Phone Number',
              //     filled: true,
              //     fillColor: Colors.white,
              //     contentPadding: EdgeInsets.all(16),
              //   ),
              //   keyboardType: TextInputType.phone,
              // ),
              // const SizedBox(height: 16),
              // const SizedBox(height: 8),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 8),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(16),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 8),
              // TextField(
              //   controller: communityController,
              //   decoration: const InputDecoration(
              //     border: OutlineInputBorder(),
              //     hintText: 'Community',
              //     filled: true,
              //     fillColor: Colors.white,
              //     contentPadding: EdgeInsets.all(16),
              //   ),
              //   maxLines: 3,
              // ),
              // const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                  ),
                  onPressed: _isLoading
                      ? null
                      : () async {
                          String email = emailController.text.trim();
                          String password = passwordController.text;
                          String firstName = firstNameController.text.trim();
                          String lastName = lastNameController.text.trim();
                          // String phoneNumber = phoneController.text.trim();
                          // String community = communityController.text.trim();

                          if (email.isEmpty ||
                              password.isEmpty ||
                              firstName.isEmpty ||
                              lastName.isEmpty 
                              // phoneNumber.isEmpty ||
                              // community.isEmpty
                              
                              ) {
                            // Show an error message here indicating that all fields are required
                            return;
                          }

                          try {
                            _showLoadingIndicator();

                            //  final user = await _accountService.create(
                            //   firstName, 
                            //   lastName, 
                            //   email, 
                            //   password, 
                            //   acceptedTerm);

                            const user = null;

                              print('cubite');
                               print(user);
                            if (user != null) {
                              // Upload image and get the download URL
                              // Show success dialog
                              await _showSuccessDialog();
                            } else {
                              // Show error dialog
                              await _showErrorDialog(
                                  'Registration failed. Please try again.');
                            }
                          } catch (e) {
                            // Show error dialog
                            await _showErrorDialog(
                                'An error occurred. Please try again later.');
                          } finally {
                            _hideLoadingIndicator();
                          }
                        },
                  child: const Text(
                    'CONTINUE',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
