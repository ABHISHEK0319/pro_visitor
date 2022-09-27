import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
  }) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                child: Image.asset(
                  urlImage,
                  fit: BoxFit.cover,
                  width: 215,
                  height: 300,
                ),
              ),
            ),
            const SizedBox(height: 64),
            Text(
              title,
              style: TextStyle(
                color: Colors.teal.shade700,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(),
              child: Text(
                subtitle,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: [
            buildPage(
              color: Colors.green.shade100,
              urlImage: 'assets/images/one.png',
              title: 'Page 1',
              subtitle: 'Lorem ipsum dolor sit amet,',
            ),
            buildPage(
              color: Colors.indigo.shade100,
              urlImage: 'assets/images/two.png',
              title: 'Page 2',
              subtitle: 'Lorem ipsum dolor sit amet,',
            ),
            buildPage(
              color: Colors.blue.shade100,
              urlImage: 'assets/images/three2.png',
              title: 'Page 3',
              subtitle: 'Lorem ipsum dolor sit amet,',
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              onPressed: () async {
                Navigator.pushNamedAndRemoveUntil(
                    context, 'registration', (route) => false);
                //navigate directly to home page..
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showHome', true);
              },
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.0),
                  ),
                  primary: Colors.white,
                  backgroundColor: Colors.teal.shade700,
                  minimumSize: const Size.fromHeight(82.0)),
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 24),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => controller.jumpToPage(2),
                    child: const Text('SKIP'),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: WormEffect(
                        spacing: 16,
                        dotColor: Colors.black26,
                        activeDotColor: Colors.teal.shade700,
                      ),
                      onDotClicked: (index) => controller.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                    child: const Text('NEXT'),
                  ),
                ],
              ),
            ),
    );
  }
}
