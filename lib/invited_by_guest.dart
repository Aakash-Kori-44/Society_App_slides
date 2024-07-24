import 'package:flutter/material.dart';
import 'my_visitor.dart';
import 'invited_guest_add.dart';

class InvitedByGuest extends StatefulWidget {
  const InvitedByGuest({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InvitedByGuestState createState() => _InvitedByGuestState();
}

class _InvitedByGuestState extends State<InvitedByGuest> {
  bool isNumberPressed = false;
  bool isContactPressed = false;

  List<bool> isCheckedList = List.generate(10, (index) => false);

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
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyVisitorPage()),
              );
            },
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 0),
          child: Text(
            'Enter Name or Number',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white, size: 37),
            onPressed: () {
               
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 33.1,
            color: const Color.fromARGB(255, 247, 223, 147),
            padding: const EdgeInsets.only(left: 36.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              "         INVITED GUEST BY",
              style: TextStyle(fontSize: 14, color: Color(0xFF5D5D5D)),
            ),
          ),
          Container(
            height: 50.0,
            color: const Color(0xFFF7C51E),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        isNumberPressed = true;
                        isContactPressed = false;
                      });
                    },
                    style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Number',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        if (isNumberPressed)
                          Container(
                            margin: const EdgeInsets.only(top: 2.0),
                            height: 3.0,
                            color: const Color(0xFFFF725E),
                            width: 55.0,
                          ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        isNumberPressed = false;
                        isContactPressed = true;
                      });
                    },
                    style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Contact',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        if (isContactPressed)
                          Container(
                            margin: const EdgeInsets.only(top: 2.0),
                            height: 3.0,
                            color: const Color(0xFFFF725E),
                            width: 55.0,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 85,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFF7C51E), width: 1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey[300],
                        child: const Icon(Icons.person, color: Colors.white, size: 50),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Abhay Sharma ${index + 1}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              '+91 8865967489',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isCheckedList[index] = !isCheckedList[index];
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 20, 0),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Colors.grey,
                                width: 2,
                              ),
                            ),
                            child: isCheckedList[index]
                                ? const Icon(Icons.check, color: Colors.grey)
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                 Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FrequentVisitorsPage()),
              );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15), backgroundColor: const Color(0xFFF7C51E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              child: const Text(
                'Add Guest',
                style: TextStyle(fontSize: 18,color: Colors.white),
              ),
            ),
          ), 
        ],
      ),
    );
  }
}
