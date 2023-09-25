import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  int selectedDay = 0;
  List<bool> showAddTimeButton = List.generate(7, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              const SizedBox(width: 8),
              Expanded(
                // Wrap the ListView.builder inside an Expanded widget
                child: SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: days.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDay = index;
                            showAddTimeButton =
                                List.generate(7, (index) => false);
                            showAddTimeButton[index] = true;
                          });
                        },
                        child: Container(
                          width: 60,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: index == selectedDay
                                    ? Colors.blue
                                    : Colors.grey.shade300,
                                width: 2,
                              ),
                            ),
                          ),
                          child: Text(
                            days[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: index == selectedDay
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: index == selectedDay
                                  ? Colors.blue
                                  : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.keyboard_arrow_down),
              const SizedBox(width: 8),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SizedBox(
              width: 420,
              child: ListView.builder(
                itemCount: 24,
                itemBuilder: (context, index) {
                  return Visibility(
                    visible: showAddTimeButton[selectedDay],
                    child: ListTile(
                      title: Text('${index.toString().padLeft(2, '0')}:00'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Add Time'),
                                content: Text(
                                    'Selected time at ${index.toString().padLeft(2, '0')}:00'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text('Add Time'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
