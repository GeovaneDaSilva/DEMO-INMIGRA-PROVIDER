import 'package:flutter/material.dart';

class Service {
  final String imageUrl;
  final String name;
  final String secondaryName;
  final int rating;
  final bool verified;

  Service({
    required this.imageUrl,
    required this.name,
    required this.secondaryName,
    required this.rating,
    required this.verified,
  });
}

class MyServicesScreen extends StatelessWidget {
  final List<Service> services = [
    Service(
      imageUrl: 'https://picsum.photos/id/1015/200/200',
      name: 'Service 1',
      secondaryName: 'Secondary Name 1',
      rating: 4,
      verified: true,
    ),
    Service(
      imageUrl: 'https://picsum.photos/id/1016/200/200',
      name: 'Service 2',
      secondaryName: 'Secondary Name 2',
      rating: 3,
      verified: false,
    ),
    Service(
      imageUrl: 'https://picsum.photos/id/1018/200/200',
      name: 'Service 3',
      secondaryName: 'Secondary Name 3',
      rating: 5,
      verified: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Services"),
      ),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network(service.imageUrl),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(service.name,
                            style: const TextStyle(fontSize: 18)),
                        const SizedBox(height: 5),
                        Text(service.secondaryName,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey)),
                        const SizedBox(height: 10),
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: index < service.rating
                                  ? Colors.yellow
                                  : Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        if (service.verified)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SizedBox(height: 5),
                              Text("Verified",
                                  style: TextStyle(color: Colors.green)),
                              SizedBox(height: 10),
                              Text(
                                "\$20/30 minutes",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ],
                ),
                if (service.verified)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              minimumSize: const Size(50, 22),
                            ),
                            child: const Text(
                              "Verified",
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "\$20/30 minutes",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
