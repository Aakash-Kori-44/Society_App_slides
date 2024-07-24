import 'package:flutter/material.dart';

class Maid extends StatefulWidget {
  const Maid({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MaidState createState() => _MaidState();
}

class _MaidState extends State<Maid> {
  final List<MaidDetails> _maids = [
    MaidDetails(
      name: 'Mena',
      role: 'Maid',
      imageUrl: 'assets/images/maid28.png',
      rating: 4,
      flats: 7,
      location: 'A-101',
    ),
    MaidDetails(
      name: 'Lily',
      role: 'Maid',
      imageUrl: 'assets/images/maid28.png',
      rating: 5,
      flats: 5,
      location: 'No-Appartment',
    ),
    MaidDetails(
      name: 'Nandani',
      role: 'Maid',
      imageUrl: 'assets/images/maid28.png',
      rating: 5,
      flats: 5,
      location: 'No-Appartment',
    ),
    MaidDetails(
      name: 'Sheela',
      role: 'Maid',
      imageUrl: 'assets/images/maid28.png',
      rating: 5,
      flats: 5,
      location: 'No-Appartment',
    ),
    MaidDetails(
      name: 'Munni',
      role: 'Maid',
      imageUrl: 'assets/images/maid28.png',
      rating: 5,
      flats: 5,
      location: 'No-Appartment',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Maid', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.yellow[600],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white, size: 30),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 247, 223, 147), Color(0xFFFFFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildFilterButton(Icons.lock, 'Available Maid', screenSize),
                  _buildFilterButton(Icons.star_rate_outlined, 'Rating', screenSize),
                  _buildFilterButton(Icons.filter_list, 'Filter', screenSize),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
                child: ListView.builder(
                  itemCount: _maids.length,
                  itemBuilder: (context, index) {
                    final maid = _maids[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(screenSize.width * 0.04),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(maid.imageUrl),
                                  radius: screenSize.width * 0.12,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        maid.name,
                                        style: TextStyle(
                                          fontSize: screenSize.width * 0.05,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: screenSize.height * 0.01),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.circular(15.0),
                                            ),
                                            child: SizedBox(
                                              height: screenSize.height * 0.03,
                                              width: screenSize.width * 0.25,
                                              child: Center(
                                                child: Text(
                                                  maid.role,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: screenSize.width * 0.02),
                                          Row(
                                            children: List.generate(5, (starIndex) {
                                              return Icon(
                                                starIndex < maid.rating
                                                    ? Icons.star
                                                    : Icons.star_border,
                                                color: Colors.amber,
                                                size: screenSize.width * 0.04,
                                              );
                                            }),
                                          ),
                                          SizedBox(width: screenSize.width * 0.02),
                                          Text(
                                            '(${maid.flats} flats)',
                                            style: TextStyle(fontSize: screenSize.width * 0.03),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: screenSize.height * 0.01),
                                      Row(
                                        children: [
                                          const Icon(Icons.home),
                                          SizedBox(width: screenSize.width * 0.02),
                                          Text(' ${maid.location}'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            color: const Color(0xFFF7C51E),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildActionButton(Icons.lock, 'Added to My Flat', screenSize),
                                _buildActionButton(Icons.call, 'Call', screenSize),
                                _buildActionButton(Icons.share, 'Share', screenSize),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(IconData icon, String label, Size screenSize) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.black, size: screenSize.width * 0.05),
      label: Text(label, style: TextStyle(color: Colors.black, fontSize: screenSize.width * 0.04)),
    );
  }

  Widget _buildActionButton(IconData icon, String label, Size screenSize) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.white, size: screenSize.width * 0.05),
      label: Text(label, style: TextStyle(color: Colors.white, fontSize: screenSize.width * 0.04)),
    );
  }
}

class MaidDetails {
  final String name;
  final String role;
  final String imageUrl;
  final int rating;
  final int flats;
  final String location;

  MaidDetails({
    required this.name,
    required this.role,
    required this.imageUrl,
    required this.rating,
    required this.flats,
    required this.location,
  });
}
