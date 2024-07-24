import 'package:flutter/material.dart';
import 'maid.dart';
class MyServicesScreen extends StatefulWidget {
  const MyServicesScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyServicesScreenState createState() => _MyServicesScreenState();
}

class _MyServicesScreenState extends State<MyServicesScreen> {
  
  final List<bool> _cardVisibility = [true, true]; 

  void _deleteCard(int index) {
    setState(() {
      _cardVisibility[index] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Services'),
        backgroundColor: Colors.yellow[600],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 247, 223, 147), Color(0xFFFFFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Display cards
              Expanded(
                child: ListView.builder(
                  itemCount: _cardVisibility.length,
                  itemBuilder: (context, index) {
                    if (!_cardVisibility[index]) return const SizedBox.shrink(); // Skip invisible cards

                    return Card(
                      elevation: 4, // Adds shadow to the card
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage: AssetImage('assets/images/maid28.png'), // Replace with your image asset
                                      radius: 40,
                                    ),
                                    const SizedBox(width: 16),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Mena',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
                                              ),
                                              child: const SizedBox(
                                                height: 25,
                                                width: 60,
                                                child: Center(
                                                  child: Text(
                                                    'Maid',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            const Row(
                                              children: [
                                                Icon(Icons.star, color: Colors.amber, size: 16),
                                                Icon(Icons.star, color: Colors.amber, size: 16),
                                                Icon(Icons.star, color: Colors.amber, size: 16),
                                                Icon(Icons.star, color: Colors.amber, size: 16),
                                                Icon(Icons.star_border, color: Colors.amber, size: 16),
                                                SizedBox(width: 4),
                                                Text('(7 flats)', style: TextStyle(fontSize: 12)),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          children: [
                                            Text('01:35 PM - 01:58 PM'),
                                            SizedBox(width: 8),
                                            Text('+1 more'),
                                          ],
                                        ),
                                        const Row(
                                          children: [
                                            Icon(Icons.home),
                                            Text(' A-101'),
                                            SizedBox(width: 8),
                                            Text('6 more flats'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton.icon(
                                      onPressed: () {},
                                      icon: const Icon(Icons.lock, color: Colors.white),
                                      label: const Text('Gate Pass', style: TextStyle(color: Colors.white)),
                                    ),
                                    TextButton.icon(
                                      onPressed: () {},
                                      icon: const Icon(Icons.call, color: Colors.white),
                                      label: const Text('Call', style: TextStyle(color: Colors.white)),
                                    ),
                                    TextButton.icon(
                                      onPressed: () {},
                                      icon: const Icon(Icons.share, color: Colors.white),
                                      label: const Text('Share', style: TextStyle(color: Colors.white)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.notifications, color: Colors.grey[600]),
                                  onPressed: () {
                                    // Add your bell icon functionality here
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => _deleteCard(index),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6FDE89),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  minimumSize: const Size(200, 50), // Adjust the width as needed
                  padding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 40.0), // Adjust padding to control width
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Maid()),
                  );
                },
                child: const Text(
                  '+ Add a New Daily Help',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
