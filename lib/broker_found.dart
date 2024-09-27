import 'package:flutter/material.dart';
import 'gas_alert.dart';
import 'complain-ticket.dart';

class BrokerFound extends StatefulWidget {
  const BrokerFound({super.key});

  @override
  _BrokerFoundState createState() => _BrokerFoundState();
}

class _BrokerFoundState extends State<BrokerFound> {
  String _selectedTab = 'ONGOING';
  int _selectedIndex = 0; // Track selected bottom navigation item

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
              // Handle back action
            },
          ),
        ),
        title: const Text(
          'Home Services',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: const Color(0xFFF7C51E),
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildTabButton('ONGOING'),
                buildTabButton('QUOTATIONS'),
                buildTabButton('HISTORY'),
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
                        'assets/images/41.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'No Booking Found',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5D5D5D),
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Look like you don`t have any booking here\nbut you can request for a service now',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF5D5D5D),
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 20), // Space between text and button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FireGasAlertScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6FDE89), // Background color
                        padding: const EdgeInsets.symmetric(
                            horizontal: 130, vertical: 12), // Padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(4), // Rounded corners
                        ),
                      ),
                      child: const Text(
                        'Book Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          // Handle navigation based on selected index
          switch (_selectedIndex) {
            case 0:
              // Navigate to Home page
              // Navigator.of(context).pop();
              break;
            case 1:
              // Navigate to My Booking page
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Complain()), // Replace with your MyBookingPage
              );
              break;
            case 2:
              // Navigate to Support page
              // Navigator.of(context).pop();
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home41.png',
              width: 24,
              height: 24,
              color: _selectedIndex == 0
                  ? Colors.blue
                  : Colors.grey, // Color for selected and unselected items
            ),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/booking41.png',
              width: 24,
              height: 24,
              color: _selectedIndex == 1
                  ? Colors.red
                  : Colors.grey, // Color for selected and unselected items
            ),
            label: 'MY Booking',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/support41.png',
              width: 24,
              height: 24,
              color: _selectedIndex == 2
                  ? Colors.blue
                  : Colors.grey, // Color for selected and unselected items
            ),
            label: 'SUPPORT',
          ),
        ],
        selectedItemColor: Colors.blue, // Color for selected item
        unselectedItemColor: Colors.grey, // Color for unselected items
        backgroundColor: Colors.white, // Background color
        elevation: 4, // Shadow for the bottom navigation bar
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
