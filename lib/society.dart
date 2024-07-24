import 'package:flutter/material.dart';
import 'bill_and_payment.dart';


class SocietyDetailsScreen extends StatefulWidget {
  const SocietyDetailsScreen({super.key});
  

  @override
  // ignore: library_private_types_in_public_api
  _SocietyDetailsScreenState createState() => _SocietyDetailsScreenState();
}

class _SocietyDetailsScreenState extends State<SocietyDetailsScreen> {
  String? _selectedBlock;
  String? _selectedSocietyNo;
  String _residentType = '';
  

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            height: screenHeight,
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
          ),
          // Building image positioned behind the main content
          Positioned(
            top: topPadding + 120,
            right: 20,
            child: Image.asset(
              'assets/images/building.png',
              width: 135.93,
              height: 103.64,
              fit: BoxFit.contain,
            ),
          ),
          // Main content
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: topPadding),
                    child: Column(
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/images/logo.webp',
                            width: 180,
                            height: 100,
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Society Details',
                                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Select Your Society Details',
                                style: TextStyle(fontSize: screenHeight * 0.02),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFEBAA),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                    ),
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight * 0.03),
                        Text(
                          'Society Name',
                          style: TextStyle(fontSize: screenHeight * 0.02),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Asnaakam',
                                border: InputBorder.none,
                                suffixIcon: Icon(Icons.apartment),
                                suffixIconColor: Color(0xFFF7C51E),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Select Block',
                          style: TextStyle(fontSize: screenHeight * 0.02),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                canvasColor: Colors.white,
                              ),
                              child: DropdownButtonFormField<String>(
                                value: _selectedBlock,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedBlock = newValue;
                                  });
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Select Block',
                                ),
                                iconEnabledColor: const Color(0xFFF7C51E),
                                items: ['A', 'B', 'C'].map((block) {
                                  return DropdownMenuItem<String>(
                                    value: block,
                                    child: Text(block),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Select Society No.',
                          style: TextStyle(fontSize: screenHeight * 0.02),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                canvasColor: Colors.white,
                              ),
                              child: DropdownButtonFormField<String>(
                                value: _selectedSocietyNo,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedSocietyNo = newValue;
                                  });
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Select Society No.',
                                ),
                                iconEnabledColor: const Color(0xFFF7C51E),
                                items: ['B-15', 'B-16', 'B-17'].map((block) {
                                  return DropdownMenuItem<String>(
                                    value: block,
                                    child: Text(block),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          'I am an/a',
                          style: TextStyle(fontSize: screenHeight * 0.02, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                title: const Text('Owner'),
                                leading: Radio(
                                  activeColor: const Color(0xFFF7C51E),
                                  value: 'owner',
                                  groupValue: _residentType,
                                  onChanged: (value) {
                                    setState(() {
                                      _residentType = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: const Text('Tenants'),
                                leading: Radio(
                                  activeColor: const Color(0xFFF7C51E),
                                  value: 'tenants',
                                  groupValue: _residentType,
                                  onChanged: (value) {
                                    setState(() {
                                      _residentType = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: const BorderSide(
                                      color: Color(0xFFF7C51E),
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/mov_in.png',
                                      width: 200,
                                      height: 100,
                                    ),
                                    const Text("Moving In"),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.01),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: const BorderSide(
                                      color: Color(0xFFF7C51E),
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/curr_res.png',
                                      width: 200,
                                      height: 100,
                                    ),
                                    const Text("Current Resident"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => BillAndPayment()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF7C51E),
                              padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Continue', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Back button
          Positioned(
            top: topPadding,
            left: 0,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                // Navigate back when arrow is pressed
              },
            ),
          ),
        ],
      ),
    );
  }
}
