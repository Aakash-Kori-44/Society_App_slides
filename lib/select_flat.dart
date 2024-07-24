import 'package:flutter/material.dart';
import 'share_invite.dart';
class SelectFlat extends StatefulWidget {
  const SelectFlat({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectFlatState createState() => _SelectFlatState();
}

class _SelectFlatState extends State<SelectFlat> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.person_2_rounded, color: Color(0xFF5D5D5D), size: 35),
                        onPressed: () {
                    
                        },
                      ),
                      _buildDropdownButton(),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.search, color: Color(0xFFF7C51E), size: 35),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.notifications),
                        onPressed: () {},
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildHeaderItem(Icons.home, 'Home', 'assets/images/home.png', 'Gate Update', 58, false),
                  _buildHeaderItem(Icons.attach_money, 'Payments', 'assets/images/money_img.png', 'MY Bills', 58, true),
                  _buildHeaderItem(Icons.location_city, 'Society', 'assets/images/society.png', 'MY Society', 58, false, showNewLabel: true),
                  _buildHeaderItem(Icons.star, 'Favorites', 'assets/images/star_img.png', 'Explore', 58, false),
                ],
              ),
              const SizedBox(height: 16),
              _buildVisitorSection(),
              const SizedBox(height: 16),
              _buildServicesSection(),
              const SizedBox(height: 16),
              _buildSlideView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderItem(
    IconData icon,
    String title,
    String imagePath,
    String actionText,
    double imageSize,
    bool showOfferLabel,
    {bool showNewLabel = false}
  ) {
    bool showOffer = showOfferLabel;
    bool showNew = showNewLabel;

    return SizedBox(
      width: 82,
      height: 120,
      child: Stack(
        children: [
          Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    showOffer = !showOffer;
                    showNew = !showNew;
                  });
                },
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(23),
                      side: const BorderSide(
                        color: Color(0xFF707070),
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        imagePath,
                        width: imageSize,
                        height: imageSize,
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                actionText,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xFFFF725E)),
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 7,
            right: 11,
            child: Visibility(
              visible: showOffer && showOfferLabel,
              child: GestureDetector(
                onTap: () {},
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF707070), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    height: 25,
                    padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF725E),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Offers',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 7,
            right: 11,
            child: Visibility(
              visible: showNew && showNewLabel,
              child: GestureDetector(
                onTap: () {},
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF707070), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    height: 25,
                    padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6FDE89),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'New',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      height: 30, // Adjust the height as needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey[400]!, // Border color
          width: 1.0, // Border width
        ),
      ),
      child: DropdownButton<String>(
        value: 'A-402',
        items: <String>['A-402', 'B-201', 'C-101'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        underline: const SizedBox.shrink(),
        onChanged: (newValue) {},
      ),
    );
  }

  Widget _buildVisitorSection() {
    return SizedBox(
      width: double.infinity,
      height: 170,
      child: Card(
        color: Colors.white,
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text(
                'Your Visitor',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5D5D5D),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: _buildVisitorButton(
                      'assets/images/icon.png',
                      'Daily\nHelp',
                      const Color(0xFFF7C51E),
                      () {},
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildVisitorButton(
                      'assets/images/preapprove.png',
                      'Pre\nApprove',
                      const Color(0xFFF7C51E),
                      () {
                         Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ShareDetailsDialog()),
                              );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVisitorButton(
    String imagePath, String title, Color buttonColor, Function() onPressed) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          width: double.infinity,
          height: 69,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xFF707070),
              width: 1.0,
            ),
          ),
          child: InkWell(
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.only(left: 59.0), // Adjust left padding for the image
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 9, // Adjust positioning of the image within the button
          child: InkWell(
            onTap: onPressed,
            child: Container(
              width: 59,
              height: 53,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFF707070),
                  width: 1.0,
                ),
              ),
              child: Center(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.fill,
                  width: 36.67,
                  height: 36.24,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildServicesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            'Our Services',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5D5D5D),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildServiceItem('Notices', 'assets/images/Group_2872.png', () {}),
            _buildServiceItem('Help Desk', 'assets/images/Group_2873.png', () {}),
            _buildServiceItem('Cntry Dlyt', 'assets/images/Group_2874.png', () {}),
            _buildServiceItem('Salon', 'assets/images/Group_2875.png', () {}),
            _buildServiceItem('Amenities', 'assets/images/Group_2876.png', () {}),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceItem(String title, String imagePath, VoidCallback onPressed) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onPressed,
        splashColor: Colors.grey.withOpacity(0.5),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                width: 55,
                height: 55,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF707070),
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlideView() {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Discover More',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5D5D5D),
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return _buildSlideItem(index, maxWidth);
                },
                onPageChanged: (int index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  width: _currentPageIndex == index ? 12.0 : 8.0,
                  height: _currentPageIndex == index ? 12.0 : 8.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPageIndex == index ? Colors.blue : Colors.grey,
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSlideItem(int index, double maxWidth) {
    List<String> slideImages = [
      'assets/images/slide1.png',
      'assets/images/slide2.png',
      'assets/images/slide3.png',
      'assets/images/slide4.png',
      'assets/images/slide5.png',
    ];

    return Container(
      width: maxWidth - 32,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Image.asset(
            slideImages[index],
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: SelectFlat(),
  ));
}
