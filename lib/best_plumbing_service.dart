import 'package:flutter/material.dart';
import 'product.dart';

class BestPlumbingServicePage extends StatelessWidget {
  const BestPlumbingServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7C51E),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'NO BROKER',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                  width: 250,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Bathroom c',
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.mic, color: Colors.grey),
                            onPressed: () {
                                                       },
                          ),
                        ],
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'assets/images/cart39.png',
                    height: 40,
                    width: 40,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: DropdownButton<String>(
              icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
              underline: Container(),
              items: <String>['Bangalore', 'Mumbai', 'Delhi'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
               
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                'assets/images/plumber39.png',
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Best Plumbing Services in Bangalore',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow[700]),
                  const SizedBox(width: 4),
                  const Text('4.7 (1.7M booking near you)'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Wrap(
              spacing: 4.0,
              runSpacing: 4.0,
              alignment: WrapAlignment.start,
              children: [
                CategoryButton(
                  imageAsset: 'assets/images/basin&sink39.png',
                  label: 'Basin & Sink',
                  isTrending: true,
                ),
                CategoryButton(
                  imageAsset: 'assets/images/grauting39.png',
                  label: 'Grouting',
                ),
                CategoryButton(
                  imageAsset: 'assets/images/bathfitting39.png',
                  label: 'Bath Fitting',
                ),
                CategoryButton(
                  imageAsset: 'assets/images/dranagepipe39.png',
                  label: 'Drainage Pipes',
                  labelAbove: 'Starting @149',
                  isTrending: false, // Adjust as needed
                ),
                CategoryButton(
                  imageAsset: 'assets/images/toilet39.png',
                  label: 'Toilet',
                  isTrending: true,
                ),
                CategoryButton(
                  imageAsset: 'assets/images/tap&mixture39.png',
                  label: 'Tap & Mixer',
                ),
                CategoryButton(
                  imageAsset: 'assets/images/watertank39.png',
                  label: 'Water Tank',
                ),
                CategoryButton(
                  imageAsset: 'assets/images/showmore39.png',
                  label: 'Show More',
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: MembershipCard(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹160',
                        style: TextStyle(
                          fontSize: 18,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Text(
                        '₹199',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text('Proceed'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String imageAsset;
  final String label;
  final String? labelAbove;
  final bool isTrending;

  const CategoryButton({super.key, 
    required this.imageAsset,
    required this.label,
    this.labelAbove,
    this.isTrending = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: MediaQuery.of(context).size.width / 4 - 10,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  padding: EdgeInsets.zero,
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.grey[300]!),
                ),
                child: Image.asset(
                  imageAsset,
                  height: 60,
                  width: 60,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          if (labelAbove != null)
            Positioned(
              top: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  labelAbove!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          if (isTrending)
            Positioned(
              top: 5,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Trending',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class MembershipCard extends StatelessWidget {
  const MembershipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
        
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'VIP MEMBERSHIP',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      '₹199 every 6 Months',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                     Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductPage()),
                  );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Smaller border radius
                    ),
                  ),
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 150,
            width: double.infinity,
            child: PageView(
              children: [
                Image.asset('assets/images/slide1.png', fit: BoxFit.cover),
                Image.asset('assets/images/slide2.png', fit: BoxFit.cover),
                Image.asset('assets/images/slide3.png', fit: BoxFit.cover),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
