import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddAdvertScreen extends StatelessWidget {
  const AddAdvertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Add Advert'),
      ),
      body: const Center(
        child: Text(
          'Add Advert Form',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateAdScreen()),
          );
        },
        label: const Text('Add Advert'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

class CreateAdScreen extends StatelessWidget {
  const CreateAdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Ad'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 26),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Ads expires in 30 days',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            const SizedBox(height: 46),
            DottedBorder(
              color: Colors.grey,
              strokeWidth: 1,
              radius: const Radius.circular(8),
              dashPattern: const [8, 4],
              child: Container(
                width: MediaQuery.of(context).size.width *
                    0.9, // 80% of the screen width
                height: MediaQuery.of(context).size.height *
                    0.2, // 20% of the screen height
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.photo_library_outlined,
                      size: 39,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Upload Advert Banner',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text('Browse Files'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 46),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Advert Title',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 6),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFFD8DADC),
                    width: 2,
                  ),
                ),
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
            const SizedBox(height: 26),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: Colors.blue,
              ),
              child: MaterialButton(
                onPressed: () {},
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
