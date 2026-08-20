import 'package:flutter/material.dart';
import 'package:flutter_final_project/pages/onboard/frontScreen.dart';

class MainSlider extends StatefulWidget {
  const MainSlider({super.key});

  @override
  State<MainSlider> createState() => _MainSliderState();
}

class _MainSliderState extends State<MainSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  int _circleindex = 0;

  final List<Map<String, String>> _pages = [
    {
      "image": "assets/images/final.png",
      "title": "Find your perfect rental on\nRedfin",
      "subtitle": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    },
    {
      "image": "assets/images/second.png",
      "title": "Sell for top dollar and save\nthousands on fees",
      "subtitle": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    },
    {
      "image": "assets/images/third.png",
      "title": "Local expertise for luxury\nhomes",
      "subtitle": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Main Swipe Content
            PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                  _circleindex = _currentPage;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 16.0,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 40), // Top space for Skip button
                      // 1. Image View
                      Expanded(
                        flex: 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            _pages[index]["image"]!,
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: _circleindex == 0
                                  ? Colors.green
                                  : Colors.grey.shade200,
                            ),
                            SizedBox(width: 2),
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: _circleindex == 1
                                  ? Colors.green
                                  : Colors.grey.shade200,
                            ),
                            SizedBox(width: 2),
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: _circleindex == 2
                                  ? Colors.green
                                  : Colors.grey.shade200,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      Text(
                        _pages[index]["title"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          height: 1.3,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        _pages[index]["subtitle"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                          height: 1.4,
                        ),
                      ),

                      const SizedBox(height: 32),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_currentPage < _pages.length - 1) {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Frontscreen();
                                  },
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0F814D),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            _currentPage == _pages.length - 1
                                ? "Get Started"
                                : "Continue",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            // Skip Button (Top Right Overlay)
            Positioned(
              top: 16,
              right: 16,
              child: TextButton(
                onPressed: () {
                  _pageController.jumpToPage(_currentPage + 1);
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(
                    color: Color(0xFF0F814D),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
