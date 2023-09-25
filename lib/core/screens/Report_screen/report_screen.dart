import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Why do you want to report this person?',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'This is an example of demo content that could be included in a report screen to help users understand what types of behavior are not allowed on the platform. Please do not actually report this content.',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 35.0),
              const Text(
                'Report Categories',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              ListTile(
                title: const Text('Inappropriate Content'),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                title: const Text('Harassment or Bullying'),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                title: const Text('Impersonation'),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                title: const Text('Spam or Misleading Content'),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                title: const Text('Intellectual Property Violation'),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                title: const Text('Hate Speech or Symbols'),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                title: const Text('Other'),
                onTap: () {},
              ),
              const Divider(),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.pink,
                  ),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width * 0.8,
                    onPressed: () {},
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
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
