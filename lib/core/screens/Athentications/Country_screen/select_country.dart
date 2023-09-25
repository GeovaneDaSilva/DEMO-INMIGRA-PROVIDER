import 'package:flutter/material.dart';
import 'package:inmigra_user/core/screens/Athentications/Register_screen/register_final_screen.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({super.key});

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  Map<String, dynamic>? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        automaticallyImplyLeading: false,
        toolbarHeight: 120,
        title: Column(
          children: const [
            Text('Select Country'),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5.0,
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(Icons.search),
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: ListView.separated(
          itemCount: countryList.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            final country = countryList[index];
            return InkWell(
              onTap: () {
                setState(() {
                  selectedCountry = country;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterFinalScreen(),
                    ),
                  );
                });
              },
              child: ListTile(
                leading: Image.network(country['logo']!),
                title: Text(country['name']!),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            top: 180,
            right: 10,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context, selectedCountry);
              },
              backgroundColor: Colors.pink,
              child: const Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}

final List<Map<String, String>> countryList = [
  {'logo': 'https://flagcdn.com/64x48/af.png', 'name': 'Afghanistan'},
  {'logo': 'https://flagcdn.com/64x48/ax.png', 'name': 'Aland Islands'},
  {'logo': 'https://flagcdn.com/64x48/al.png', 'name': 'Albania'},
  {'logo': 'https://flagcdn.com/64x48/us.png', 'name': 'United States'},
  {'logo': 'https://flagcdn.com/64x48/cn.png', 'name': 'China'},
  {'logo': 'https://flagcdn.com/64x48/es.png', 'name': 'Spain'},
  {'logo': 'https://flagcdn.com/64x48/pt.png', 'name': 'Portugal'},
  {'logo': 'https://flagcdn.com/64x48/jp.png', 'name': 'Japan'},
  {'logo': 'https://flagcdn.com/64x48/gb.png', 'name': 'United Kingdom'},
  {'logo': 'https://flagcdn.com/64x48/de.png', 'name': 'Germany'},
  {'logo': 'https://flagcdn.com/64x48/bd.png', 'name': 'Bangladesh'},
  {'logo': 'https://flagcdn.com/64x48/fr.png', 'name': 'France'},
  {'logo': 'https://flagcdn.com/64x48/it.png', 'name': 'Italy'},
  {'logo': 'https://flagcdn.com/64x48/kr.png', 'name': 'South Korea'},
  {'logo': 'https://flagcdn.com/64x48/bf.png', 'name': 'Burkina Faso'},
  {'logo': 'https://flagcdn.com/64x48/br.png', 'name': 'Brazil'},
  {'logo': 'https://flagcdn.com/64x48/ca.png', 'name': 'Canada'},
  {'logo': 'https://flagcdn.com/64x48/mx.png', 'name': 'Mexico'},
  {'logo': 'https://flagcdn.com/64x48/in.png', 'name': 'India'},
  {'logo': 'https://flagcdn.com/64x48/id.png', 'name': 'Indonesia'},
  {'logo': 'https://flagcdn.com/64x48/au.png', 'name': 'Australia'},
  {'logo': 'https://flagcdn.com/64x48/nz.png', 'name': 'New Zealand'},
  {'logo': 'https://flagcdn.com/64x48/sg.png', 'name': 'Singapore'},
  {'logo': 'https://flagcdn.com/64x48/hk.png', 'name': 'Hong Kong'},
  {'logo': 'https://flagcdn.com/64x48/tw.png', 'name': 'Taiwan'},
  {'logo': 'https://flagcdn.com/64x48/th.png', 'name': 'Thailand'},
  {'logo': 'https://flagcdn.com/64x48/vn.png', 'name': 'Vietnam'},
  {'logo': 'https://flagcdn.com/64x48/my.png', 'name': 'Malaysia'},
  {'logo': 'https://flagcdn.com/64x48/ph.png', 'name': 'Philippines'},
  {'logo': 'https://flagcdn.com/64x48/kh.png', 'name': 'Cambodia'},
  {'logo': 'https://flagcdn.com/64x48/la.png', 'name': 'Laos'},
  {'logo': 'https://flagcdn.com/64x48/mm.png', 'name': 'Myanmar'},
  {'logo': 'https://flagcdn.com/64x48/bn.png', 'name': 'Brunei'},
  {'logo': 'https://flagcdn.com/64x48/tl.png', 'name': 'Timor-Leste'},
  {'logo': 'https://flagcdn.com/64x48/nl.png', 'name': 'Netherlands'},
  {'logo': 'https://flagcdn.com/64x48/be.png', 'name': 'Belgium'},
];
