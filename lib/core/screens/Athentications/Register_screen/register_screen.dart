import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../Country_screen/select_country.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _selectedLanguage = 'English';
  String? _selectedRadioValue;
  final TextEditingController _languageController = TextEditingController();
  final List<String> _languages = [
    'English',
    'Spanish',
    'Portuguese',
  ];

  void _showLanguageSelector(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: 300,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: const Text(
                      'Select Language',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _languages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return RadioListTile<String>(
                          title: Text(_languages[index]),
                          value: _languages[index],
                          groupValue: _selectedLanguage,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedLanguage = value!;
                              _languageController.text = _selectedLanguage;
                            });
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(360, 50),
                        backgroundColor: Colors.pink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.blue[900],
        ),
        backgroundColor: Colors.blue[900],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.3),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet<void>(
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10)),
                              ),
                              builder: (BuildContext context) {
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: InkWell(
                                                onTap: () =>
                                                    Navigator.pop(context),
                                                child: const Text(
                                                  'CLOSE',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Colors.pink,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          ListTile(
                                            title: const Text('Users'),
                                            trailing: Radio<String>(
                                              value: 'users',
                                              groupValue: _selectedRadioValue,
                                              onChanged: (value) {
                                                setState(() {
                                                  _selectedRadioValue = value!;
                                                });
                                              },
                                            ),
                                          ),
                                          const Divider(),
                                          ListTile(
                                            title: const Text('Consultant'),
                                            trailing: Radio<String>(
                                              value: 'consultant',
                                              groupValue: _selectedRadioValue,
                                              onChanged: (value) {
                                                setState(() {
                                                  _selectedRadioValue = value!;
                                                });
                                              },
                                            ),
                                          ),
                                          const Divider(),
                                          ListTile(
                                            title:
                                                const Text('Service Provider'),
                                            trailing: Radio<String>(
                                              value: 'service_provider',
                                              groupValue: _selectedRadioValue,
                                              onChanged: (value) {
                                                setState(() {
                                                  _selectedRadioValue = value!;
                                                });
                                              },
                                            ),
                                          ),
                                          const Divider(),
                                          const SizedBox(height: 20),
                                          if (_selectedRadioValue != null)
                                            Center(
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  EasyLoading.show(
                                                      status: 'Please wait...');
                                                  Future.delayed(
                                                      const Duration(
                                                          seconds: 3), () {
                                                    EasyLoading.dismiss();
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const SelectCountry(),
                                                      ),
                                                    ).then((_) {
                                                      // This block will execute when the new screen is popped and the user comes back to this screen.
                                                      // You can put any code you want to execute when the user comes back here
                                                    });
                                                  });
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  minimumSize:
                                                      const Size(360, 50),
                                                  backgroundColor: Colors.pink,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20,
                                                      vertical: 14),
                                                  textStyle: const TextStyle(
                                                      fontSize: 15),
                                                ),
                                                child: const Text(
                                                  'CONTINUE',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(360,
                                50), // set a fixed minimum size for the button
                            backgroundColor: Colors.pink,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 14), // use a fixed padding
                            textStyle: const TextStyle(fontSize: 15),
                          ),
                          child: const Text(
                            "REGISTER AS",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.08),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Select Languages',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 31),
                      TextField(
                        readOnly: true,
                        controller: _languageController,
                        onTap: () {
                          _showLanguageSelector(context);
                        },
                        decoration: InputDecoration(
                          hintText: _selectedLanguage.isNotEmpty
                              ? _selectedLanguage
                              : 'Select Language',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xFFD8DADC),
                              width: 2,
                            ),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 20),
                            child: Image.asset(
                              'assets/images/english.png',
                              width: 25,
                              height: 25,
                            ),
                          ),
                          suffixIcon: const Icon(Icons.keyboard_arrow_down),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFD8DADC),
                              width: 2,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.all(16),
                        ),
                      ),
                      const SizedBox(height: 44),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text(
                            'GO BACK',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
