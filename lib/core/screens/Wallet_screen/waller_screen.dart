import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wallet'),
        bottom: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.pink, Colors.blueAccent],
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          tabs: const [
            Tab(
              text: 'History',
            ),
            Tab(
              text: 'Withdraw',
            ),
            Tab(
              text: 'Range',
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 18,
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Balance: \$280',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Container(
            color: Colors.pink[400],
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.pink[400],
                    backgroundColor:
                        Colors.white, // sets the button text color to pink
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15), // sets the button corner radius to 15
                    ),
                  ),
                  child: const Text('Withdraw'),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Minimum withdrawal amount is \$100',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // History tab content
                ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2.0,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.blueGrey,
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: const Text('Booking Consultant'),
                        subtitle: const Text('df324sdf453'),
                        trailing: const Text('\$20'),
                      ),
                    );
                  },
                ),

                // Withdraw tab content
                ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2.0,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: const Text('Withdrawal Amount'),
                        subtitle: const Text('3jgh4sdas234'),
                        trailing: const Text(
                          '- \$ 20',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),

                // Range tab content
                ListView.builder(
                  itemCount: 22,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2.0,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: const Text('Withdrawal Range'),
                        subtitle: const Text('sdsd43435sdf2323'),
                        trailing: const Text(
                          '\$ 20',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
