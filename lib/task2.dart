import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Flutter Drawer Example'),
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: Text('Hello, World!'),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 40.0), // Space from the top
          _buildHeader(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                _buildDrawerItem(
                  imagePath: 'assets/images/task2.png',
                  title: 'Introducing NoBroker Homes',
                  subtitle: 'Post a Property for ad free',
                ),
                _buildExpansionTile("Society Inbox"),
                _buildExpansionTile("Marketplace"),
                _buildExpansionTile("My Profile"),
                _buildExpansionTile("Gate Updates"),
                _buildExpansionTile("Home Services"),
                _buildExpansionTile("Explore"),
                _buildReferralTile(),
                _buildVersionTile(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.04),
      ),
      child: const Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 35.0,
                backgroundColor: Colors.white,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
              SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Akshansh Ranjan",
                    style: TextStyle(fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "Flat No: A-402",
                    style: TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 25.0),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({required String imagePath, required String title, required String subtitle}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Image.asset(
            imagePath,
            width: 50.0,
            height: 50.0,
          ),
          const SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 14.0),
              ),
              const SizedBox(height: 4.0),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExpansionTile(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildReferralTile() {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Refer more, Earn More",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4.0),
                const Text(
                  "Earn amazon voucher worth ₹1000",
                  style: TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 40),
                    backgroundColor: const Color.fromARGB(255, 128, 196, 131),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  child: Text("Refer a Society", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.0),
          Image.asset(
            'assets/images/task2.1.png', // Replace with your image asset
            width: 70.0,
            height: 100.0,
          ),
        ],
      ),
    );
  }

  Widget _buildVersionTile() {
    return ListTile(
      title: Center(child: Text("Version : 3.4.39")),
    );
  }
}
