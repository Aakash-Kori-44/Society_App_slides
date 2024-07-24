import 'package:flutter/material.dart';
import 'invite_guest.dart';

class FrequentVisitorsPage extends StatefulWidget {
  const FrequentVisitorsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FrequentVisitorsPageState createState() => _FrequentVisitorsPageState();
}

class _FrequentVisitorsPageState extends State<FrequentVisitorsPage> {
  bool isNumberPressed = true;
  bool isContactPressed = false;
  bool isAddMorePressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7C51E),
        leading: const Icon(Icons.arrow_back, color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF7C51E), Color(0xFFFFFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: const Color(0xFFF7C51E),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 33.1,
                    color: const Color.fromARGB(255, 247, 223, 147),
                    padding: const EdgeInsets.only(left: 36.0),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "FREQUENT VISITORS",
                      style: TextStyle(fontSize: 14, color: Color(0xFF5D5D5D)),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: SizedBox(
                      height: 29,
                      width: 140.35,
                      child: Image.asset(
                        'assets/images/repeat_grid19.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Center(
                    child: Text(
                      'Your frequently invited guests will be shown here.',
                      style: TextStyle(color: Color(0xFF5D5D5D)),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 33.1,
                  color: const Color.fromARGB(255, 247, 223, 147),
                  padding: const EdgeInsets.only(left: 36.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "INVITED GUEST BY",
                    style: TextStyle(fontSize: 14, color: Color(0xFF5D5D5D)),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: isNumberPressed
                                    ? const Color(0xFFFF725E)
                                    : Colors.transparent,
                                width: 3.0,
                              ),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isNumberPressed = true;
                                isContactPressed = false;
                              });
                            },
                            child: const Center(
                              child: Text(
                                'Number',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: isContactPressed
                                    ? const Color(0xFFFF725E)
                                    : Colors.transparent,
                                width: 3.0,
                              ),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isNumberPressed = false;
                                isContactPressed = true;
                              });
                            },
                            child: const Center(
                              child: Text(
                                'Contact',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                        ),
                        child: const Row(
                          children: [
                            Text('+91'),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 40.0, bottom: 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 8),
                        Image.asset(
                          'assets/images/icon19.png',
                          height: 20,
                          width: 20,
                          fit: BoxFit.contain,
                        ),
                        const Text(
                          'Add more',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 240),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VisitPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15),
                        backgroundColor: const Color(0xFFF7C51E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Add Guest',
                          style:
                              TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
