import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GymHomePage(),
    );
  }
}

class GymHomePage extends StatefulWidget {
  @override
  _GymHomePageState createState() => _GymHomePageState();
}

class _GymHomePageState extends State<GymHomePage> {
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.6); // Adjust viewportFraction for SlideView
    _pageController.addListener(() {
      setState(() {
        _currentPageIndex = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(13, 30, 13, 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top section (replacing the AppBar)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/pic.png'), // Replace with your profile image
                      radius: 28,
                    ),
                    Text(
                      "FIT-TO-BE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Search button with Border and Radius
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.search, color: Colors.white),
                        onPressed: () {},
                        iconSize: 28,
                      ),
                    ),
                  ],
                ),
              ),
              // Exercise sections with the more_horiz icon on the right side of the section title
              sectionTitleWithIcon('Exercises'),
              exerciseCard('Full Body', '50+ Tasks', '30 Min', 'assets/images/Flogo.png'),
              sectionTitleWithIcon('Biceps Exercises'),
              Container(
                height: 200,
                child: PageView(
                  controller: _pageController,
                  children: [
                    bicepsExerciseCard('Biceps Exercise 1', '30 Min', 'assets/images/Flogo.png'),
                    bicepsExerciseCard('Biceps Exercise 2', '25 Min', 'assets/images/Flogo.png'),
                    bicepsExerciseCard('Biceps Exercise 3', '40 Min', 'assets/images/Flogo.png'),
                  ],
                ),
              ),
              // Dots Indicator
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    width: 8.0,
                    height: 8.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPageIndex == index ? Colors.white : Colors.white.withOpacity(0.5),
                    ),
                  );
                }),
              ),
              sectionTitleWithIcon('Abs Exercises'),
              exerciseCard('Abs', '', '40 Min', 'assets/images/Flogo.png'),
              _buildSlideView(), // Added SlideView
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        child: Icon(Icons.add, color: Colors.black),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.home, color: Colors.yellow),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.fitness_center, color: Colors.white),
                onPressed: () {},
              ),
              SizedBox(width: 50), // Space for the FAB
              IconButton(
                icon: Icon(Icons.health_and_safety, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.calculate, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to create the section title with more_horiz icon on the right
  Widget sectionTitleWithIcon(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(Icons.more_horiz, color: Colors.white), // Align more_horiz icon with text
        ],
      ),
    );
  }

  Widget exerciseCard(String title, String subtitle, String duration, String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0), // Removed horizontal margin
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imagePath,
              height: 180,
              width: double.infinity, // Ensure image covers full width
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (subtitle.isNotEmpty)
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.white, size: 14),
                    SizedBox(width: 4),
                    Text(
                      duration,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Build the dots indicator
  Widget buildDot({required int index}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      width: 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPageIndex == index ? Colors.white : Colors.white.withOpacity(0.5),
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
      width: maxWidth * 0.6, // Adjusted width for visibility
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

 Widget bicepsExerciseCard(String title, String duration, String imagePath) {
  return Container(
    width: 250, // Set fixed width to show image partially
    margin: const EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.black26,
    ),
    child: Stack(
      children: [
        Positioned(
          right: 0, // Align image to the right
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imagePath,
              width: 120, // Fixed width for the image
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10), // Add space between title and duration
              Row(
                children: [
                  Icon(Icons.access_time, color: Colors.white, size: 14),
                  SizedBox(width: 4),
                  Text(
                    duration,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

}
