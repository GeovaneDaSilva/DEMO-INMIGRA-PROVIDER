import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inmigra_user/core/screens/Account_screen/account.dart';
import 'package:inmigra_user/core/screens/Bar_scan_screen/bar_code_screen.dart';
import 'package:inmigra_user/core/screens/Block_report_screen/block_report_profile.dart';
import 'package:inmigra_user/core/screens/Book_details_screen/book_details_screen.dart';
import 'package:inmigra_user/core/screens/Booking_data_screen/booking_data.dart';
import 'package:inmigra_user/core/screens/Booking_screen/booking.dart';
import 'package:inmigra_user/core/screens/Chat_screen/chat_screen.dart';
import 'package:inmigra_user/core/screens/Settings_screen/settings.dart';
import 'package:inmigra_user/core/screens/Video_meeting_screen/video_meeting.dart';
import 'package:inmigra_user/core/screens/Wallet_screen/waller_screen.dart';
import '../../../authentication/cubit/authentication_cubit.dart';
import '../Account_screen/Account Details/account_details.dart';
import '../../../authentication/view/authentication_screen.dart';
import '../Examine_category_screen/examine_category.dart';
import '../My_services_screen/my_services.dart';
import '../Package_screen/packages.dart';
import '../Review_screen/reviews_screen.dart';
import '../Support_screen/support.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedItemPosition = 0;

  final List<Widget> _screens = [
    const Screen1(),
    const Screen2(),
    const Screen3(),
    const Screen4(),
    const Screen5(),
  ];

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
          border: Border.all(
            color: Colors.white,
            width: 4,
          ),
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.pink,
          child: const Icon(
            Icons.calendar_month_outlined,
            color: Colors.white,
            size: 29,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Screen5(),
              ),
            ).then((_) {
              // This block will execute when the new screen is popped and the user comes back to this screen.
              // You can put any code you want to execute when the user comes back here
            });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _screens[_selectedItemPosition],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 40,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedItemPosition,
        onTap: (int index) => setState(() => _selectedItemPosition = index),
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Comunidad',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cleaning_services),
            label: 'Servicios',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place_outlined),
            label: 'Negocios',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz_outlined),
            label: 'Mas',
          ),
        ],
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text('Florida'),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on),
            onPressed: () {
              // Do something when the user taps the map icon
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Do something when the user taps the search icon
            },
          ),
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Do something when the user taps the notifications icon
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg'),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Write something here...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.qr_code),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BarCodeScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.format_quote,
                      color: Colors.purple,
                    ),
                    onPressed: () {
                      // Add code to handle button press
                    },
                  ),
                  const Text('Quote'),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.article,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      // Add code to handle button press
                    },
                  ),
                  const Text('Article'),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.poll,
                      color: Colors.pink,
                    ),
                    onPressed: () {
                      // Add code to handle button press
                    },
                  ),
                  const Text('Poll'),
                ],
              ),
            ],
          ),
          const Divider(
            thickness: 8,
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Flexible(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: const CircleAvatar(
                                radius: 22,
                                backgroundImage: NetworkImage(
                                    'https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg'),
                              ),
                              title: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: const [
                                          Text(
                                            'Geovane',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          CircleAvatar(
                                            radius: 11,
                                            backgroundImage: NetworkImage(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSyarmeuIq9ykdG4Pg_S7pmpoAw4c_d1PX3Q&usqp=CAU'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Trojens',
                                      style: TextStyle(
                                        color: Colors.pink,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text('Have a good time!!!'),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '😍',
                                        style: TextStyle(fontSize: 23),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                            Icons.chat_bubble_outline),
                                        onPressed: () {
                                          // Add code to handle button press
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.share),
                                        onPressed: () {
                                          // Add code to handle button press
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text('1 Reactions  '),
                                      Text('9 Comments'),
                                    ],
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.more_horiz),
                                onPressed: () {
                                  // Add code to handle button press
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 8,
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     // Do something when the user taps the "Explore" button
      //   },
      //   icon: Icon(Icons.view_module),
      //   label: Text('Explore'),
      // ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Handyman'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Services',
                style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Hero(
                      tag:
                          'ac_service_1', // Unique tag for the AC service widget
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Image.asset(
                          'assets/images/ac.jpg',
                          width: 100.0,
                          height: 100.0,
                        ),
                      ),
                    ),
                    const Text('AC Repairing'),
                  ],
                ),
                Column(
                  children: [
                    Hero(
                      tag:
                          'beauty_service_1', // Unique tag for the beauty service widget
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/salon.jpg',
                          width: 100.0,
                          height: 100.0,
                        ),
                      ),
                    ),
                    const Text('Beauty Salon'),
                  ],
                ),
                Column(
                  children: [
                    Hero(
                      tag:
                          'electrician_service_1', // Unique tag for the electrician service widget
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Image.asset(
                          'assets/images/electricians.jpeg',
                          width: 100.0,
                          height: 100.0,
                        ),
                      ),
                    ),
                    const Text('Electrician'),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Hero(
                      tag:
                          'ac_service_2', // Unique tag for the AC service widget
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Image.asset(
                          'assets/images/ac.jpg',
                          width: 100.0,
                          height: 100.0,
                        ),
                      ),
                    ),
                    const Text('AC Repairing'),
                  ],
                ),
                Column(
                  children: [
                    Hero(
                      tag:
                          'beauty_service_2', // Unique tag for the beauty service widget
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/salon.jpg',
                          width: 100.0,
                          height: 100.0,
                        ),
                      ),
                    ),
                    const Text('Beauty Salon'),
                  ],
                ),
                Column(
                  children: [
                    Hero(
                      tag:
                          'electrician_service_2', // Unique tag for the electrician service widget
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Image.asset(
                          'assets/images/electricians.jpeg',
                          width: 100.0,
                          height: 100.0,
                        ),
                      ),
                    ),
                    const Text('Electrician'),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Featured Services',
                    style: TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 60.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.pink,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    side: const BorderSide(
                                        color: Colors.pink, width: 2),
                                  ),
                                ),
                                child: const Text('Service 1'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.pink,
                                  backgroundColor: Colors.pink,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    side: const BorderSide(
                                        color: Colors.pink, width: 2),
                                  ),
                                ),
                                child: const Text(
                                  'Service 2',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.pink,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    side: const BorderSide(
                                        color: Colors.pink, width: 2),
                                  ),
                                ),
                                child: const Text('Service 3'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.pink,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    side: const BorderSide(
                                        color: Colors.pink, width: 2),
                                  ),
                                ),
                                child: const Text('Service 4'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.pink,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    side: const BorderSide(
                                        color: Colors.pink, width: 2),
                                  ),
                                ),
                                child: const Text('Service 5'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.pink,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    side: const BorderSide(
                                        color: Colors.pink, width: 2),
                                  ),
                                ),
                                child: const Text('Service 6'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.pink,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    side: const BorderSide(
                                        color: Colors.pink, width: 2),
                                  ),
                                ),
                                child: const Text('Service 7'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                height: 300,
                child: ListView(
                  children: [
                    for (var i = 0; i < 10; i++)
                      Card(
                        elevation: 2, // set the elevation to create a shadow
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTODgikvgcP-cKJ4XFH0nO-OaFPzVNKT9kzjg&usqp=CAU',
                                height: 130,
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              'Product $i',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Text(
                                      '\$10',
                                      style: TextStyle(
                                        color: Colors.pink,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                  ],
                                ),
                                const SizedBox(width: 8),
                                const Text('Lohan'),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
      ),
      body: const Center(
        child: Text(
          'Need Google Map API Key',
          style: TextStyle(
            color: Colors.black,
            fontSize: 23,
          ),
        ),
      ),
    );
  }
}

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 150.0,
          child: Column(
            children: [
              ListTile(
                leading:
                    const Icon(Icons.people_alt_outlined, color: Colors.blue),
                title: const Text('Consultant Booking'),
                onTap: () {
                  // Do something when user selects Consultant Booking
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.work_outline, color: Colors.blue),
                title: const Text('Service Provider Booking'),
                onTap: () {
                  // Do something when user selects Service Provider Booking
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        title: const Text('More'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AccountScreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.person_pin,
                            color: Colors.pink,
                            size: 28,
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Profile',
                            style: TextStyle(fontSize: 18),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyServicesScreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.contact_page_outlined,
                            color: Colors.pink,
                            size: 28,
                          ),
                          SizedBox(width: 16),
                          Text(
                            'My Services',
                            style: TextStyle(fontSize: 18),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PackagePlanScreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.contact_page_outlined,
                            color: Colors.pink,
                            size: 28,
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Update Packages',
                            style: TextStyle(fontSize: 18),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BookingHistoryScreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.dashboard_outlined,
                            color: Colors.pink,
                            size: 28,
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Orders History',
                            style: TextStyle(fontSize: 18),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WalletScreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.account_balance_wallet_outlined,
                            color: Colors.pink,
                            size: 28,
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Wallet',
                            style: TextStyle(fontSize: 18),
                          ),
                          Spacer(),
                          Text(
                            '\$210',
                            style: TextStyle(
                              color: Colors.pink,
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AccountsScreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.list,
                            color: Colors.pink,
                            size: 28,
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Transaction History',
                            style: TextStyle(fontSize: 18),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const BookingDetailsScreen()),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.calendar_month_outlined,
                            color: Colors.pink,
                            size: 28,
                          ),
                          SizedBox(width: 16),
                          Text(
                            'My Booking',
                            style: TextStyle(fontSize: 18),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(),
                    Row(
                      children: const [
                        Icon(
                          Icons.translate,
                          color: Colors.pink,
                          size: 28,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Languages',
                          style: TextStyle(fontSize: 18),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VideoMeetingScreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.video_camera_front_outlined,
                            color: Colors.pink,
                            size: 28,
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Video Meeting',
                            style: TextStyle(fontSize: 18),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BarCodeScreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.qr_code_scanner_outlined,
                            color: Colors.pink,
                            size: 28,
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Scanner',
                            style: TextStyle(fontSize: 18),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ExamineCategoryScreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.list_alt_outlined,
                            color: Colors.pink,
                            size: 28,
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Examine',
                            style: TextStyle(fontSize: 18),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(),
                    Row(
                      children: const [
                        Icon(
                          Icons.poll_outlined,
                          color: Colors.pink,
                          size: 28,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Examine Ranking',
                          style: TextStyle(fontSize: 18),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(),
                    Row(
                      children: const [
                        Icon(
                          Icons.privacy_tip_outlined,
                          color: Colors.pink,
                          size: 28,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Privacy Policy',
                          style: TextStyle(fontSize: 18),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingScreen()),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.settings_outlined,
                            color: Colors.pink,
                            size: 28,
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Settings',
                            style: TextStyle(fontSize: 18),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const BlockReportProfileScreen()),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.people_outline,
                            color: Colors.pink,
                            size: 28,
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Blocked List',
                            style: TextStyle(fontSize: 18),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(),
                    Row(
                      children: const [
                        Icon(
                          Icons.email_outlined,
                          color: Colors.pink,
                          size: 28,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Contact Us',
                          style: TextStyle(fontSize: 18),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SupportScreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.help_outline,
                            color: Colors.pink,
                            size: 28,
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Help & Support',
                            style: TextStyle(fontSize: 18),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.login_outlined,
                            color: Colors.pink,
                            size: 28,
                          ),
                          SizedBox(width: 16),
                          Text(
                            'Logout',
                            style: TextStyle(fontSize: 18),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              // Add more row items here
            ],
          ),
        ),
      ),
    );
  }
}

class Screen5 extends StatelessWidget {
  const Screen5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "Consultants Florida",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.calendar_month),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  height: 60.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.pink,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(
                                  color: Colors.pink, width: 2),
                            ),
                          ),
                          child: const Text('Service 1'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.pink,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(
                                  color: Colors.pink, width: 2),
                            ),
                          ),
                          child: const Text(
                            'Service 2',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.pink,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(
                                  color: Colors.pink, width: 2),
                            ),
                          ),
                          child: const Text('Service 3'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.pink,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(
                                  color: Colors.pink, width: 2),
                            ),
                          ),
                          child: const Text('Service 4'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.pink,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(
                                  color: Colors.pink, width: 2),
                            ),
                          ),
                          child: const Text('Service 5'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.pink,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(
                                  color: Colors.pink, width: 2),
                            ),
                          ),
                          child: const Text('Service 6'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.pink,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(
                                  color: Colors.pink, width: 2),
                            ),
                          ),
                          child: const Text('Service 7'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              PinkButton(icon: Icons.code, text: "Zip Code"),
              PinkButton(icon: Icons.star, text: "Rating"),
              PinkButton(icon: Icons.online_prediction, text: "Online"),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              PinkButton(icon: Icons.disabled_visible_rounded, text: "Offline"),
              PinkButton(icon: Icons.location_pin, text: "Location"),
              PinkButton(icon: Icons.price_change, text: "Price"),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              PinkButton(icon: Icons.sort_by_alpha, text: "Alphabetically"),
              PinkButton(icon: Icons.translate, text: "Language"),
            ],
          ),
          const SizedBox(
            height: 9,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.pink, width: 3),
                            ),
                            child: const CircleAvatar(
                              radius: 35,
                              backgroundImage: NetworkImage(
                                'https://qph.cf2.quoracdn.net/main-thumb-1529746431-200-ilmthkmwexpgmbqqgkiwdanovfosliym.jpeg',
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 9,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'John Doe',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              'Marcodio Digital',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 12,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 12,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 12,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 12,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.grey,
                                    size: 12,
                                  ),
                                  SizedBox(width: 8),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 63.0),
                                child: Text(
                                  '\$20/30 minutes',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Image.network(
                        'https://cdn.britannica.com/33/4833-004-828A9A84/Flag-United-States-of-America.jpg',
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(width: 16),
                      Image.network(
                        'https://cdn.britannica.com/36/4336-004-6BD81071/Flag-Spain.jpg',
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(width: 16),
                      Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/1024px-Flag_of_Brazil.svg.png',
                        width: 40,
                        height: 40,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const DottedLine(
                    dashColor: Colors.grey,
                    dashGapLength: 4,
                    dashLength: 2,
                    lineThickness: 1,
                    dashRadius: 0,
                    dashGapRadius: 0,
                    dashGradient: null,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueGrey[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BookingScreen(),
                              ),
                            );
                          },
                          child: const Text('Available Now')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PinkButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const PinkButton({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.29,
      height: 35,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon),
        label: Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
        ),
      ),
    );
  }
}
