import 'package:flutter/material.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Reviews'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 76.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(
                Icons.message_outlined,
                size: 105.0,
                color: Colors.black,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'No Reviews Yet',
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
