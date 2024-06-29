import 'package:flutter/material.dart';
import 'package:taskbuilder/Helperfunction/helper.dart';
import 'package:taskbuilder/Screens/login.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(children: [
          OnBoardingPage1(
              image: "assets/images/Group 182.png",
              title: 'Manage your tasks',
              subTitle:
                  'You can easily manage all of your daily tasks in Do Me for free.'),
          OnBoardingPage2(
              image: "assets/images/Frame 162 (1).png",
              title: 'Create daily routine',
              subTitle:
                  'In Task Builder you can create your personalized routine to stay productive.'),
          OnBoardingPage3(
              image: "assets/images/ABC.png",
              title: 'Organize your tasks',
              subTitle:
                  'You can organize your daily tasks by adding your tasks into separate categories.')
        ]),
      ],
    ));
  }

  Positioned get OnBoardPageskip => Positioned(
      top: 56,
      right: 24,
      child: TextButton(
          onPressed: () {
            // Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: const Text('Skip')));
}

class OnBoardingPage1 extends StatelessWidget {
  const OnBoardingPage1({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image(
                image: AssetImage(image),
                width: Helperfunctions.screenWidth() * 0.8,
                height: Helperfunctions.screenHeight() * 0.6,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              )
            ],
          )),
      Positioned(
        right: 24,
        bottom: 56,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const OnBoardingPage2(
                        image: "assets/images/Frame 162 (1).png",
                        title: 'Create daily routine',
                        subTitle:
                            'In Task Builder you can create your personalized routine to stay productive.')));
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: const Text(
              'Next',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
      Positioned(
          top: 56,
          right: 10,
          child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: const Text('Skip', style: TextStyle(fontSize: 20))))
    ]));
  }
}

class OnBoardingPage2 extends StatelessWidget {
  const OnBoardingPage2({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image(
                image: AssetImage(image),
                width: Helperfunctions.screenWidth() * 0.8,
                height: Helperfunctions.screenHeight() * 0.6,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              )
            ],
          )),
      Positioned(
        right: 24,
        bottom: 56,
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OnBoardingPage3(
                          image: "assets/images/ABC.png",
                          title: 'Organize your tasks',
                          subTitle:
                              'You can organize your daily tasks by adding your tasks into separate categories.')));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15,left: 15),
              child: const Text(
                'Next',
                style: TextStyle(fontSize: 20),
              ),
            )),
      ),
      Positioned(
          top: 56,
          left: 10,
          child: TextButton(
              onPressed: () {
                Navigator.pop(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OnBoardingPage1(
                            image: "assets/images/Group 182.png",
                            title: 'Manage your tasks',
                            subTitle:
                                'You can easily manage all of your daily tasks in Do Me for free.')));
              },
              child: const Text('Back', style: TextStyle(fontSize: 20)))),
      Positioned(
          top: 56,
          right: 10,
          child: TextButton(
              onPressed: () {
                 Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: const Text('Skip', style: TextStyle(fontSize: 20))))
    ]));
  }
}

class OnBoardingPage3 extends StatelessWidget {
  const OnBoardingPage3({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image(
                image: AssetImage(image),
                width: Helperfunctions.screenWidth() * 0.8,
                height: Helperfunctions.screenHeight() * 0.6,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              )
            ],
          )),
      Positioned(
          top: 56,
          left: 10,
          child: TextButton(
              onPressed: () {
                Navigator.pop(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OnBoardingPage2(
                            image: "assets/images/Frame 162 (1).png",
                            title: 'Create daily routine',
                            subTitle:
                                'In Task Builder you can create your personalized routine to stay productive.')));
              },
              child: const Text('Back', style: TextStyle(fontSize: 20)))),
      Positioned(
        right: 24,
        bottom: 56,
        child: ElevatedButton(
            onPressed: () {
             Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15,left: 15),
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 20),
              ),
            )),
      ),
      Positioned(
          top: 56,
          right: 10,
          child: TextButton(
              onPressed: () {
                 Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: const Text('Skip', style: TextStyle(fontSize: 20))))
    ]));
  }
}
