import 'package:flutter/material.dart';
import 'package:newshive/views/login_screen.dart';
import 'package:newshive/views/utils/helper.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  List<Map<String, dynamic>> pageList = [
    {
      'imageAssets': 'image/img intro 1.png',
      'title': 'Stay Informed, Stay Ahead',
      'subtitle':
          'Get the latest news and updates from around the world, all in one place',
    },
    {
      'imageAssets': 'image/img intro 2.png',
      'title': 'Personalized News Experience',
      'subtitle':
          'Tailor your news feed to match your interests and preferences',
    },
    {
      'imageAssets': 'image/img intro 3.png',
      'title': 'Connect with the World',
      'subtitle':
          'Join a community of news enthusiasts and share your thoughts and opinions',
    },
  ];

  final PageController _pageController = PageController();
  int _currentPage = 0;

  void nextPage() {
    if (_currentPage < pageList.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemCount: pageList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 100),
                      Image.asset(pageList[index]['imageAssets'], height: 300),
                      vsLarge,
                      Text(
                        pageList[index]['title'],
                        style: headline4.copyWith(
                          color: cPrimary,
                          fontWeight: bold,
                        ),
                      ),
                      vsSmall,
                      Text(pageList[index]['subtitle'], style: subtitle1),
                      Spacer(),
                      if (_currentPage == pageList.length - 1)
                        ElevatedButton(
                          onPressed: nextPage,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: cPrimary,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Get Started',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        )
                      else
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed:
                                  () => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const LoginScreen(),
                                    ),
                                  ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: cTextBlue,
                                padding: const EdgeInsetsDirectional.symmetric(
                                  horizontal: 50,
                                  vertical: 15,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                'Skip',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: nextPage,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: cPrimary,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 15,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                'Next',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}