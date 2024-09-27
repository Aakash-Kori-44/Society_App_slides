// ignore: file_names
import 'package:flutter/material.dart';

class Complain extends StatefulWidget {
  const Complain({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ComplainState createState() => _ComplainState();
}

class _ComplainState extends State<Complain> {
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
          'Complaints and Tickets',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            color: Colors.grey[400],
            height: 2.0,
          ),
        ),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: [
              buildTicketContainer(
                ticketId: 'PP-114',
                category: 'Plumbing',
                time: '04:15 PM | 12 Aug 2024',
                description: 'Bathroom pipe leakage',
                location: 'Location: A-402',
                responses: 2,
                createdBy: 'Pradeep Mishra, A-402',
                assignee: 'Umakant',
              ),
              const SizedBox(height: 16),
              buildTicketContainer(
                ticketId: 'PP-115',
                category: 'Electrical',
                time: '10:30 AM | 13 Aug 2024',
                description: 'Power outage in the living room',
                location: 'Location: B-301',
                responses: 3,
                createdBy: 'Amit Sharma, B-301',
                assignee: 'Ravi Kumar',
              ),
              const SizedBox(height: 16),
              buildTicketContainer(
                ticketId: 'PP-116',
                category: 'HVAC',
                time: '08:45 AM | 14 Aug 2024',
                description: 'AC not cooling properly',
                location: 'Location: C-202',
                responses: 1,
                createdBy: 'Neha Singh, C-202',
                assignee: 'Suresh Yadav',
              ),
              const SizedBox(height: 16),
              buildTicketContainer(
                ticketId: 'PP-117',
                category: 'Painting',
                time: '01:00 PM | 15 Aug 2024',
                description: 'Walls need repainting',
                location: 'Location: D-105',
                responses: 0,
                createdBy: 'Rajesh Gupta, D-105',
                assignee: 'Anita Sharma',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Center(
                  child: AlertDialog(
                    contentPadding: const EdgeInsets.all(16.0),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Center(
                          child: Image.asset(
                            'assets/images/popup51.png',
                            height: 120,
                            width: 100,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Center(
                          child: Text(
                            'No BizInfra needs storage and\ncamera permission to\nshare files.',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center, // Center the text
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Handle "Not Now" button action
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      const Color.fromRGBO(0, 0, 0, 1),
                                  backgroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius
                                          .zero), // Remove border radius
                                ),
                                child: const Text('Not Now'),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Center(
                                        child: AlertDialog(
                                          contentPadding: const EdgeInsets.all(16.0),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Center(
                                                child: Image.asset(
                                                  'assets/images/mike52.png',
                                                  height: 120,
                                                  width: 100,
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              const Center(
                                                child: Text(
                                                  'No BizInfra needs permission to\naccess microphone.',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign
                                                      .center, // Center the text
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop(); // Handle "Not Now" button action
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        foregroundColor:
                                                            const Color
                                                                .fromRGBO(
                                                                0, 0, 0, 1),
                                                        backgroundColor:
                                                            Colors.white,
                                                        padding: const EdgeInsets
                                                            .symmetric(
                                                                vertical: 16),
                                                        shape: const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .zero), // Remove border radius
                                                      ),
                                                      child: const Text('Not Now'),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  Expanded(
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        // Handle "Continue" button action
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            const Color(
                                                                0xFF6FDE89),
                                                        padding: const EdgeInsets
                                                            .symmetric(
                                                                vertical: 16),
                                                        shape: const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .zero), // Remove border radius
                                                      ),
                                                      child: const Text('Continue'),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF6FDE89),
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius
                                          .zero), // Remove border radius
                                ),
                                child: const Text('Continue'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          elevation: 0,
          backgroundColor: const Color(0xFF6FDE89),
          child: const Icon(Icons.add, color: Colors.white, size: 50),
        ),
      ),
    );
  }

  Widget buildTicketContainer({
    required String ticketId,
    required String category,
    required String time,
    required String description,
    required String location,
    required int responses,
    required String createdBy,
    required String assignee,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ticket ID: $ticketId',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add your close functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // Remove border radius
                      ),
                    ),
                    child: const Text(
                      'Close',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                category,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                time,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                location,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 8),
              Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.message, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    '$responses Responses',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Created By: $createdBy',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 50,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Assignee',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  assignee,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
