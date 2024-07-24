import 'package:flutter/material.dart';
import 'invited_guest_add.dart';
import 'my_services.dart';

class VisitPage extends StatefulWidget {
  const VisitPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VisitPageState createState() => _VisitPageState();
}

class _VisitPageState extends State<VisitPage> {
  bool showAddBang = true;
  bool isDarkMode = false;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: isDarkMode
                ? const LinearGradient(
                    colors: [Color(0xFF000000), Color(0xFF424242)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )
                : const LinearGradient(
                    colors: [Color(0xFFF7C51E), Color(0xFFFFFFFF)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FrequentVisitorsPage()),
                  );
                },
              ),
              Divider(
                color: Colors.white.withOpacity(0.5),
              ),
              const SizedBox(height: 10),
              if (showAddBang)
                Container(
                  width: 120.48,
                  height: 30,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Add Bang",
                          style: TextStyle(fontSize: 14, color: Color(0xFF5D5D5D)),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.clear, color: Colors.grey),
                        onPressed: () {
                          setState(() {
                            showAddBang = false;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 10),
              Divider(
                color: Colors.white.withOpacity(0.5),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFF707070),
                          width: 1,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[300],
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Text(
                      'Long Duration Visit',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '  DAY OF VISIT',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 20),
              Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white.withOpacity(0.4),
                              shadowColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(),
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/images/clock20.png',
                              color: Colors.white,
                              height: 24,
                              width: 24,
                            ),
                            label: const Text('Today', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white.withOpacity(0.4),
                              shadowColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(),
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/images/clock_req20.png',
                              color: Colors.white,
                              height: 24,
                              width: 24,
                            ),
                            label: const Text('Tomorrow', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 10,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6FDE89),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                  padding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 16.0),
                ),
                onPressed: () {},
                icon: const Icon(Icons.date_range, color: Colors.white),
                label: const Text('PICK A DATE', style: TextStyle(color: Colors.white)),
              ),
              const Spacer(),
              const Divider(
                color: Color(0xFFF7C51E),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF7C51E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                  padding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 5.0),
                ),
                onPressed: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyServicesScreen()),
                  );
                },
                child: const Text(
                  'Invite 1 Guest',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const SizedBox(height: 10),
              SwitchListTile(
                title: const Text('Dark Mode'),
                value: isDarkMode,
                onChanged: (bool value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
                secondary: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
