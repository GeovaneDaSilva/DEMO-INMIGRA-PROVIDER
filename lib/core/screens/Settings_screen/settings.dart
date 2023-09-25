import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as htmlDom;

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key});

  Future<String> _fetchTermsAndConditions() async {
    final Uri url = Uri.parse(
        'https://api-release-mobile.inmigrausa.com/api/list-terms-conditions');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Successfully fetched data
      String data = response.body;
      return _parseHtmlData(data);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  String _parseHtmlData(String htmlString) {
    var document = htmlParser.parse(htmlString);
    var buffer = StringBuffer();
    _parseNode(document.body, buffer);
    return buffer.toString();
  }

  void _parseNode(htmlDom.Node? node, StringBuffer buffer) {
    if (node == null) return;

    if (node.nodeType == htmlDom.Node.TEXT_NODE) {
      buffer.write(node.text);
    } else if (node.nodeType == htmlDom.Node.ELEMENT_NODE) {
      var element = node as htmlDom.Element;
      if (element.localName == 'br') {
        buffer.write('\n');
      }
      for (var child in element.nodes) {
        _parseNode(child, buffer);
      }
    }
  }

  Future<void> _showTermsAndConditions(BuildContext context) async {
    try {
      String data = await _fetchTermsAndConditions();

      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text('Privacy & Terms'),
          content: SingleChildScrollView(
            child: Text(data),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        ),
      );
    } catch (e) {
      // Show an error dialog if there was an error making the API call
      showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
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
        centerTitle: true,
        elevation: 0,
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedCard(
                onTap: () => _showTermsAndConditions(context),
                icon: Icons.list,
                iconColor: Colors.pink,
                label: 'Privacy & Terms',
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

class ElevatedCard extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color iconColor;
  final String label;

  const ElevatedCard({
    required this.onTap,
    required this.icon,
    required this.iconColor,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Row(
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 28,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
