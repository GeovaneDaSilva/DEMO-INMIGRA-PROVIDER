// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Account {
  final String name;
  final String type;
  final String state;
  final String category;

  Account({
    required this.name,
    required this.type,
    required this.state,
    required this.category,
  });
}

class AccountsScreen extends StatefulWidget {
  @override
  _AccountsScreenState createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  List<Account> accounts = [];

  @override
  void initState() {
    super.initState();
    _fetchAccounts();
  }

  Future<void> _fetchAccounts() async {
    const String apiUrl =
        'https://api-release-mobile.inmigrausa.com/api/accounts/:type/:state/:category';
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Successfully fetched data
        List<dynamic> responseData = jsonDecode(response.body);

        setState(() {
          accounts = responseData
              .map((data) => Account(
                    name: data['name'],
                    type: data['type'],
                    state: data['state'],
                    category: data['category'],
                  ))
              .toList();
        });
      } else {
        // Show an error dialog if the API call failed
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('Failed to fetch data. Please try again later.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      // Show an error dialog if there was an error making the API call
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('An error occurred. Please try again later.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accounts'),
      ),
      body: ListView.builder(
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          final account = accounts[index];
          return ListTile(
            title: Text(account.name),
            subtitle: Text('Type: ${account.type}\nState: ${account.state}\nCategory: ${account.category}'),
          );
        },
      ),
    );
  }
}
