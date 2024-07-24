import 'package:flutter/material.dart';
import 'bill_and_payment.dart';
import 'invited_by_guest.dart';

class MyVisitorPage extends StatefulWidget {
  const MyVisitorPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyVisitorPageState createState() => _MyVisitorPageState();
}

class _MyVisitorPageState extends State<MyVisitorPage> {
  String _selectedTab = 'EXPECTED';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7C51E),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 25),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BillAndPayment()),
              );
            },
          ),
        ),
        title: const Text(
          'My Visitor',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white, size: 37),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InvitedByGuest()),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: const Color(0xFFF7C51E),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildTabButton('EXPECTED'),
                buildTabButton('PACKAGES'),
                buildTabButton('PAST'),
                buildTabButton('DENIED'),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFF7C51E),
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 120),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 280,
                      width: 350,
                      child: Image.asset(
                        'assets/images/slide18.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'No Parcel Found',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5D5D5D),
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Looks like currently no Parcel\navailable for you',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF5D5D5D),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTabButton(String tabName) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = tabName;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: _selectedTab == tabName
                  ? const Color(0xFFFF725E)
                  : Colors.transparent,
              width: 2.0,
            ),
          ),
        ),
        child: Text(
          tabName,
          style: TextStyle(
            color: _selectedTab == tabName
                ? const Color(0xFFFF725E)
                : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
