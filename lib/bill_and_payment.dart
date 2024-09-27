import 'package:flutter/material.dart';
import 'society.dart';

class BillAndPayment extends StatefulWidget {
  const BillAndPayment({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BillAndPaymentState createState() => _BillAndPaymentState();
}

class _BillAndPaymentState extends State<BillAndPayment> {
  @override
  Widget build(BuildContext context) {
    double topPadding = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFF6D8),
              Color(0xFFFFFFFF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight,
            child: Column(
              children: [
                Stack(
                  children: [
                    // Background gradient and content
                    Column(
                      children: [
                        SizedBox(height: topPadding + 39),
                        Center(
                          child: Image.asset(
                            'assets/images/logo.webp',
                            width: 102,
                            height: 95,
                          ),
                        ),
                        Center(
                          child: Image.asset(
                            'assets/images/bill.png',
                            width: 325,
                            height: 325,
                          ),
                        ),
                        const SizedBox(height: 33), // Space between image and text fields
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Bills and Payments',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF5D5D5D),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'View and pay your maintenance, electricity and \n                      utilities bills from apps.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF5D5D5D),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        Center(
                          child: SizedBox(
                            width: 358,
                            height: 55,
                            child: ElevatedButton(
                              onPressed: () {
                              
                                
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFF7C51E),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1),
                                ),
                              ),
                              child: const Text(
                                'Get Started',
                                style: TextStyle(color: Colors.white, fontSize: 29),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 45),
                        const SizedBox(
                          height: 19,
                          width: 262,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'By clicking Get started, you agree to the',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF5D5D5D),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              // Handle the press for terms and conditions here
                            },
                            child: const Text(
                              'Terms and Conditions',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF5D5D5D),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 40,
                      left: 5,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Color(0xFFF7C51E)),
                        onPressed: () {
                           Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SocietyDetailsScreen()),
                              ); // Close the dialog
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
