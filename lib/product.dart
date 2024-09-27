import 'package:flutter/material.dart';
import 'broker_found.dart';
class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // Map to hold the quantities for each product item
  Map<String, int> quantities = {
    'Repair or Replacement of one waste pipe': 0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  width: 280,
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
                              // Handle mic action
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
                  onTap: () {
                    // Handle cart tap action
                  },
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
      backgroundColor: Colors.grey[200],
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF7C51E), Color(0xFFFFFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 350, // Same width as the search bar
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      productItem(
                        title: 'Wash Basin',
                        originalPrice: '₹490',
                        discountedPrice: '₹469',
                        description:
                            '• Installation of all kinds of wash-basin (labour)\n• Procurement of spare parts (at extra cost)',
                        onAdd: () {},
                      ),
                      const Divider(color: Colors.grey),  // Divider after each product item
                      productItem(
                        title: 'Wash Basin Blockage Removal',
                        originalPrice: '₹244',
                        discountedPrice: '₹199',
                        description:
                            '• Blockage removal of wash basin and waste pipe\n• Procurement of spare parts (at extra cost)',
                        onAdd: () {},
                      ),
                      const Divider(color: Colors.grey),  // Divider after each product item
                      productItem(
                        title: 'Repair or Replacement of\n one waste pipe',
                        originalPrice: '₹296',
                        discountedPrice: '₹209',
                        description:
                            '• Repair or Replacement of one waste pipe\n• Procurement of spare parts (at extra cost)',
                        onAdd: () {},
                        isQuantity: true, // Flag for quantity selector
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Text(
                            '₹160',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            '₹169',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFBB00),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'You Have Saved ₹ 9',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BrokerFound()),
                  );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Increased padding
                      minimumSize: const Size(120, 40), // Increased minimum size
                      backgroundColor: Colors.green,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // No border radius
                      ),
                    ),
                    child: const Text('Proceed', style: TextStyle(fontSize: 14,color: Colors.white)), // Adjusted text size
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
Widget productItem({
  required String title,
  required String originalPrice,
  required String discountedPrice,
  required String description,
  required VoidCallback onAdd,
  bool isQuantity = false,
}) {
  // Initialize quantity with 0 if not already set
  final int quantity = quantities[title] ?? 0;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          if (isQuantity) 
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (quantity > 0) {
                        quantities[title] = quantity - 1;
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(24, 24), // Smaller size
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: const Icon(Icons.remove, color: Colors.white, size: 16), // Smaller icon size
                ),
                SizedBox(
                  width: 30, // Width for the quantity display
                  child: Text(
                    '$quantity',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      quantities[title] = quantity + 1;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size(24, 24), // Smaller size
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 16), // Smaller icon size
                ),
              ],
            )
          else 
            ElevatedButton(
              onPressed: onAdd,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4), // Adjusted padding
                minimumSize: const Size(50, 30), // Minimum size
                backgroundColor: Colors.green, // Green color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
                textStyle: const TextStyle(fontSize: 12), // Font size
              ),
              child: const Text('ADD', style: TextStyle(color: Colors.white)),
            ),
        ],
      ),
      Row(
        children: [
          Text(
            originalPrice,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            discountedPrice,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      const SizedBox(height: 5),
      Text(
        description,
        style: const TextStyle(fontSize: 12), // Reduced font size for description
      ),
      const SizedBox(height: 5),
      const Text(
        'Know More >',
        style: TextStyle(color: Colors.blue),
      ),
    ],
  );
}
}
